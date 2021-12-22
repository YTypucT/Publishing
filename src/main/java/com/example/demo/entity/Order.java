package com.example.demo.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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

    private Date Date;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Name_client")
    private Client Name_client;

    @OneToMany(mappedBy = "order")
    private List<Structure_of_order> structure_of_orders;

    public Integer computeAllBooksCost(){
        Integer cost = 0;
        for ( Structure_of_order structure_of_orders : structure_of_orders ){
            cost = cost + structure_of_orders.getCost()*structure_of_orders.getCount();
        }
        return cost;
    }

    public String getDate() {
        String pattern = "MM/dd/yyyy";
        DateFormat df = new SimpleDateFormat(pattern);
        return  df.format(Date);
    }

    //    @OneToMany
//    private Structure_of_order structure_of_order;
}
