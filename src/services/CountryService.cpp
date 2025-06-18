#include "CountryService.h"
#include "../DatabaseManager.h"
#include <iostream>

// NOTA: Usando la API de Sentencias Preparadas, que es la esperada por libpqxx v7.x

int CountryService::createCountry(const std::string& name) {
    try {
        pqxx::connection& C = DatabaseManager::getInstance().getConnection();
        C.prepare("create_country", "INSERT INTO utilities.countrys (country_name) VALUES ($1) RETURNING id_country;");

        pqxx::work W(C);
        pqxx::result R = W.exec_prepared("create_country", name);

        W.commit();
        return R[0][0].as<int>();
    } catch (const std::exception &e) {
        std::cerr << "Error en createCountry: " << e.what() << std::endl;
        return -1;
    }
}

std::vector<models::Country> CountryService::getAllCountries() {
    std::vector<models::Country> countries;
    try {
        pqxx::connection& C = DatabaseManager::getInstance().getConnection();
        pqxx::nontransaction N(C);
        pqxx::result R = N.exec("SELECT id_country, country_name FROM utilities.countrys ORDER BY country_name;");
        for (auto row : R) {
            countries.push_back({row[0].as<int>(), row[1].as<std::string>()});
        }
    } catch (const std::exception &e) {
        std::cerr << "Error en getAllCountries: " << e.what() << std::endl;
    }
    return countries;
}

std::optional<models::Country> CountryService::getCountryById(int id) {
    try {
        pqxx::connection& C = DatabaseManager::getInstance().getConnection();
        C.prepare("find_country", "SELECT id_country, country_name FROM utilities.countrys WHERE id_country = $1;");

        pqxx::nontransaction N(C);
        pqxx::result R = N.exec_prepared("find_country", id);

        if (!R.empty()) {
            return models::Country{R[0][0].as<int>(), R[0][1].as<std::string>()};
        }
    } catch (const std::exception &e) {
        std::cerr << "Error en getCountryById: " << e.what() << std::endl;
    }
    return std::nullopt;
}

bool CountryService::updateCountry(int id, const std::string& newName) {
    try {
        pqxx::connection& C = DatabaseManager::getInstance().getConnection();
        C.prepare("update_country", "UPDATE utilities.countrys SET country_name = $1 WHERE id_country = $2;");
        
        pqxx::work W(C);
        pqxx::result R = W.exec_prepared("update_country", newName, id);
        
        W.commit();
        return R.affected_rows() > 0;
    } catch (const std::exception &e) {
        std::cerr << "Error en updateCountry: " << e.what() << std::endl;
        return false;
    }
}

bool CountryService::deleteCountry(int id) {
    try {
        pqxx::connection& C = DatabaseManager::getInstance().getConnection();
        C.prepare("delete_country", "DELETE FROM utilities.countrys WHERE id_country = $1;");

        pqxx::work W(C);
        pqxx::result R = W.exec_prepared("delete_country", id);

        W.commit();
        return R.affected_rows() > 0;
    } catch (const std::exception &e) {
        std::cerr << "Error en deleteCountry: " << e.what() << std::endl;
        return false;
    }
}