package com.example.demo.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Client {

    @Id
    private String Name_client;

    private String Address;

    private String Contact;

    private String Email;

    private String Phone;


}
