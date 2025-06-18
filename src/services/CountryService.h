#ifndef COUNTRY_SERVICE_H
#define COUNTRY_SERVICE_H

#include "../models/Country.h" // Incluimos nuestro modelo
#include <vector>
#include <optional>

class CountryService {
public:
    int createCountry(const std::string& name);
    std::optional<models::Country> getCountryById(int id);
    std::vector<models::Country> getAllCountries();// esta funcion me va a devolver una lista o vector del typo country.
    bool updateCountry(int id, const std::string& newName);
    bool deleteCountry(int id);
};

#endif // COUNTRY_SERVICE_H