package com.example.demo.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Contract {

    @Id
    private Integer No_contract;

    private Date Start_date;

    private Integer Duration;

    private String Dissolve;

    private Date Dissolve_date;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Code_book")
    private Book Code_book;
}
