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
public class Manuscript {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer Code_man;

    private String Name_man;

    private String Text;

    private String Genre;

    private String Count_characters;

    private String Status;

    @ManyToMany(cascade = {
            CascadeType.PERSIST,
            CascadeType.MERGE
    })
    @JoinTable(name = "Author",
            joinColumns = @JoinColumn(name = "Code_man"),
            inverseJoinColumns = @JoinColumn(name = "No_passport")
    )
    private List<Writer> writerList;


    public String getText() {
        if (Text != null ){
            return Text;
        }else {
            return "Нет текста";
        }
    }


    public String getAllAuthors(){
        StringBuilder stringBuilder = new StringBuilder("");
        for (Writer writer : writerList){
            stringBuilder.append(writer.getFIO() + " ");
        }
        return stringBuilder.toString();
    }
}
