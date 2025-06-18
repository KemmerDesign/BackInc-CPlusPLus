#include "CountryController.h"

CountryController::CountryController(CountryService& service) : countryService_(service) {}

void CountryController::addRoutes(crow::SimpleApp& app) {
    // RUTA PARA OBTENER TODOS LOS PAÍSES
    CROW_ROUTE(app, "/api/countries")
    .methods("GET"_method)
    ([this](){
        // 1. Llamamos a nuestro servicio experto.
        auto countries = countryService_.getAllCountries();

        // 2. Creamos una lista JSON.
        crow::json::wvalue::list json_list;
        for (const auto& country : countries) {
            json_list.push_back({
                {"id", country.id},
                {"name", country.name}
            });
        }
        
        // 3. Devolvemos la lista JSON como respuesta.
        return crow::response(crow::json::wvalue(json_list));
    });

    // RUTA PARA OBTENER UN PAÍS POR SU ID
    CROW_ROUTE(app, "/api/countries/<int>")
    .methods("GET"_method)
    ([this](int id){
        // 1. Llamamos al servicio.
        auto country = countryService_.getCountryById(id);

        // 2. Si el país existe, lo devolvemos como un objeto JSON.
        if (country) {
            crow::json::wvalue json_obj({
                {"id", country->id},
                {"name", country->name}
            });
            return crow::response(json_obj);
        }

        // 3. Si no existe, devolvemos un error 404 (Not Found).
        return crow::response(404, "Country not found");
    });
    
    // RUTA PARA CREAR UN NUEVO PAÍS
    CROW_ROUTE(app, "/api/countries")
    .methods("POST"_method)
    ([this](const crow::request& req){
        // 1. Leemos el cuerpo de la petición JSON.
        auto body = crow::json::load(req.body);
        if (!body || !body.has("name")) {
            return crow::response(400, "Bad Request: Missing 'name' field.");
        }
        std::string name = body["name"].s();//que hace en concreto esta linea de comando? sobre todo el .s()?

        // 2. Llamamos al servicio para crear el país.
        int new_id = countryService_.createCountry(name);
        if (new_id != -1) {
            // 3. Devolvemos un 201 (Created) con la info del nuevo país.
            crow::json::wvalue json_response({
                {"id", new_id},
                {"name", name},
                {"message", "Country created successfully"}
            });
            return crow::response(201, json_response);
        }
        
        return crow::response(500, "Internal Server Error");
    });
}