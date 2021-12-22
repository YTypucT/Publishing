package com.example.demo.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor

public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer Code_book;

    private String Name_book;

    private String Cover;

    private String Color_print;

    private Integer Start_price;

    private Integer Price;

    private Integer Count;

    private Integer Year_of_public;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Code_Man")
    private Manuscript Code_Man;

    @ManyToMany(mappedBy = "bookList")
    private List<Order> orderList;



}
