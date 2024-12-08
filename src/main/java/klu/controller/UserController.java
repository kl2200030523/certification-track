package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import klu.model.User;
import klu.model.UserManager;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserManager userManager;

    @PostMapping("/register")
    public String register(@RequestBody User user) {
        return userManager.saveUser(user);
    }

    @PostMapping("/login")
    public String login(@RequestBody User user) {
        return userManager.loginUser(user.getUsername(), user.getPassword());
    }
}
