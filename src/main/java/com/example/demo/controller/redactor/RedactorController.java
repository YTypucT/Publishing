package com.example.demo.controller.redactor;

import com.example.demo.entity.Manuscript;
import com.example.demo.repostory.ManuscriptRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class RedactorController {

    @Autowired
    private ManuscriptRepository manuscriptRepository;

    @GetMapping("/redactor")
    public String getAllManuscripts(Model model){
        List<Manuscript> all = manuscriptRepository.findAll();
        model.addAttribute("manuscripts", all);
        return "/redactor/redactor";
    }

    @GetMapping("/redactor/edit/{id}")
    public String editManuscript(Model model, @PathVariable(name = "id") Integer id){
        Manuscript manuscript = manuscriptRepository.findById(id).get();
        System.out.println(manuscript.getText());
        System.out.println(manuscript.getCode_man());
        model.addAttribute("value", manuscript.getText());
        model.addAttribute("id", String.valueOf(manuscript.getCode_man()));
        return "/redactor/edit";
    }

    @PostMapping("/redactor/edit")
    public String postEdit(@RequestParam("id") Integer id,
                         @RequestParam("text") String text
                         ){
        Manuscript manuscript = manuscriptRepository.findById(id).get();
        manuscript.setText(text);
        manuscriptRepository.save(manuscript);
        return "redirect:/redactor/";
    }
}
