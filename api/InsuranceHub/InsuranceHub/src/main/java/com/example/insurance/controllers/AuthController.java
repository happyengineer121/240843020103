package com.example.insurance.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.insurance.entities.User;
import com.example.insurance.services.UserService;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins="http://localhost:5173")
public class AuthController {

    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public ResponseEntity<?> registerUser(@RequestBody User user) {
    	
        System.out.println("Received request: " + user);
        Optional<User> chk = userService.findUserByEmail(user.getEmail());

        if (chk.isPresent()) {
        	  return ResponseEntity.status(HttpStatus.CONFLICT)
                      .body("{\"message\": \"User already exists. Please sign in.\"}");
        } else {
            try {
                User registeredUser = userService.registerUser(user);
                return ResponseEntity.ok(registeredUser);
            } catch (Exception e) {
                return ResponseEntity.badRequest().body("Error: " + e.getMessage());
            }
        }
    }



    // Login endpoint
    @PostMapping("/login")
    public ResponseEntity<?> loginUser(@RequestBody User user) {
        // Perform login by matching email and password
        Optional<User> loggedInUser = userService.loginUser(user.getEmail(), user.getPassword());

        // If user found, return 200 OK with the user details
        if (loggedInUser.isPresent()) {
            return ResponseEntity.ok(loggedInUser.get());
        } else {
            // If not found, return 401 Unauthorized with an error message
            return ResponseEntity.status(401).body("{\"message\": \"invalid credentials please enter valid credentails\"}");
        }
    }
}
