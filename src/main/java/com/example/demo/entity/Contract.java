package com.example.demo.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

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

    public String getDissolve_date() {
        if (Dissolve_date != null){
            String pattern = "MM/dd/yyyy";
            DateFormat df = new SimpleDateFormat(pattern);
            return df.format(Dissolve_date);
        }else {
            return "Нет";
        }
    }

    public String getStart_date() {
        if (Start_date != null){
            String pattern = "MM/dd/yyyy";
            DateFormat df = new SimpleDateFormat(pattern);
            return df.format(Start_date);
        }else {
            return "Нет";
        }
    }

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Code_book")
    private Book Code_book;
}
