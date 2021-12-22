package com.example.demo.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Writer {

    @Id
    @Column(name = "No_passport")
    private Integer No_passport;

    private String FIO;

    private String Address;

    private String Email;

    private String Phone;

    @ManyToMany(mappedBy = "writerList")
    private List<Manuscript> manuscriptList;


}
