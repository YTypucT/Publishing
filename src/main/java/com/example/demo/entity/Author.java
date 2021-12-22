package com.example.demo.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Getter
@Setter
public class Author implements Serializable {

    @EmbeddedId
    private Author_id Id;

    @MapsId("Code_man")
    @ManyToOne
    @JoinColumns(value = {
            @JoinColumn(name = "Code_man", referencedColumnName = "Code_man")})
    private Manuscript manuscript;

    @MapsId("No_passport")
    @ManyToOne
    @JoinColumns(value = {
            @JoinColumn(name = "No_passport", referencedColumnName = "No_passport")})
    private Writer writer;
}
