package com.guc.backend.guc_backend;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "GUC Backend Application is Running Successfully";
    }

    @GetMapping("/health")
    public String health() {
        return "UP";
    }
}
