package com.zs.entity;

import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component
public class Admin implements Serializable {
    private String username;
    private String password;
    private String url;

    public Admin() {
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "username='" + username + '\'' +
                ", password=" + password +
                '}';
    }
}
