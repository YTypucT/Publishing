package com.example.demo.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
public class Structure_of_order implements Serializable {

    @EmbeddedId
    private Structure_of_order_id  Id;

//    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
//    @JoinColumn(name = "Code_book")
//    private List<Book> bookList=new ArrayList<>();
//
//    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
//    @JoinColumn(name = "No_order")
//    private List<Order> orderList=new ArrayList<>();

    @MapsId("Code_book")
    @ManyToOne
    @JoinColumns(value = {
            @JoinColumn(name = "Code_book", referencedColumnName = "Code_book")})
    private Book book;

    @MapsId("No_order")
    @ManyToOne
    @JoinColumns(value = {
            @JoinColumn(name = "No_order", referencedColumnName = "No_order")})
    private Order order;

    private Integer Count;

    private Integer Cost;

}