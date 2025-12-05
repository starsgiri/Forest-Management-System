package com.forest.management.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class WelcomeController {
    
    @GetMapping("/")
    public Map<String, Object> welcome() {
        Map<String, Object> response = new HashMap<>();
        response.put("application", "Forest Management System API");
        response.put("version", "1.0.0");
        response.put("status", "Running");
        
        Map<String, String> endpoints = new HashMap<>();
        endpoints.put("Animals", "/api/animals");
        endpoints.put("Trees", "/api/trees");
        endpoints.put("Plants", "/api/plants");
        endpoints.put("Officers", "/api/officers");
        endpoints.put("Visitors", "/api/visitors");
        endpoints.put("Resources", "/api/resources");
        
        response.put("endpoints", endpoints);
        
        Map<String, String> examples = new HashMap<>();
        examples.put("Get all animals", "GET http://localhost:8080/api/animals");
        examples.put("Get animal by ID", "GET http://localhost:8080/api/animals/1");
        examples.put("Get animals by zone", "GET http://localhost:8080/api/animals/zone/North");
        examples.put("Create animal", "POST http://localhost:8080/api/animals");
        
        response.put("examples", examples);
        
        return response;
    }
    
    @GetMapping("/health")
    public Map<String, String> health() {
        Map<String, String> response = new HashMap<>();
        response.put("status", "UP");
        response.put("message", "Forest Management System is running successfully!");
        return response;
    }
}
