package com.example.demo.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "Orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer No_order;

    private Integer Cost;

    private Integer Count;

    private Date Date;

    public String stringBookList(){
        StringBuilder bookString = new StringBuilder("");
        for (Book book : bookList) {
            bookString.append(book.getName_book() + " ");
        }
        return bookString.toString();
    }

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Name_client")
    private Client Name_client;

    @ManyToMany(cascade = {
            CascadeType.PERSIST,
            CascadeType.MERGE
    })
    @JoinTable(name = "Structure_of_order",
            joinColumns = @JoinColumn(name = "No_order"),
            inverseJoinColumns = @JoinColumn(name = "Code_book")
    )
    private List<Book> bookList;
}
