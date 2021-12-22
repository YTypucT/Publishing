package com.example.demo.entity;

import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class Author_id implements Serializable {
    private int Code_man;
    private int No_passport;
}
