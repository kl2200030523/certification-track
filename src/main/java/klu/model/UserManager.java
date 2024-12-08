package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import klu.repository.UserRepository;

@Service
public class UserManager {

    @Autowired
    UserRepository userRepository;

    public String saveUser(User user) {
        try {
            if (userRepository.validateUsername(user.getUsername()) > 0) {
                return "Username already exists!";
            }
            userRepository.save(user);
            return "User registered successfully.";
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    public String loginUser(String username, String password) {
        try {
            if (userRepository.validateCredentials(username, password) == 0) {
                return "401 - Invalid credentials!";
            }
            return "200 - Login successful!";
        } catch (Exception e) {
            return e.getMessage();
        }
    }
}
