package klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import klu.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    @Query("select count(u) from User u where u.username = :username")
    int validateUsername(@Param("username") String username);

    @Query("select count(u) from User u where u.username = :username and u.password = :password")
    int validateCredentials(@Param("username") String username, @Param("password") String password);
}
