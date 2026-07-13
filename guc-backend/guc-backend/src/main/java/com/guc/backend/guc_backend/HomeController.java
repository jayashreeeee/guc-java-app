package com.guc.backend.guc_backend;

import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public Map<String,Object> home(){

        Map<String,Object> response = new LinkedHashMap<>();

        response.put("application","GUC Backend");
        response.put("status","Running");
        response.put("developer","GUC");
        response.put("framework","Spring Boot");
        response.put("packaging","WAR");
        response.put("version","1.0.0");
        response.put("serverTime", LocalDateTime.now());

        return response;
    }
}
