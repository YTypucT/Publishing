package com.example.demo.controller.consultant;

import com.example.demo.entity.*;
import com.example.demo.repostory.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ConsultantController {

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private ManuscriptRepository manuscriptRepository;

    @Autowired
    private WriterRepository writerRepository;

    @Autowired
    private ContractRepository contractRepository;

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private OrderRepository orderRepository;

    @GetMapping("/consultant")
    public String getConsultantClientPage(){
        return "/consultant/consultant";
    }

    @GetMapping("/consultant/client")
    public String getConsultantClientPage(Model model){
        List<Client> all = clientRepository.findAll();
        model.addAttribute("clients",  all);
        return "/consultant/client";
    }

    @GetMapping("/consultant/manuscript")
    public String getConsultantManuscriptPage(Model model){
        List<Manuscript> all = manuscriptRepository.findAll();
        model.addAttribute("manuscripts",  all);
        return "/consultant/manuscript";
    }

    @GetMapping("/consultant/writer")
    public String getConsultantWriterPage(Model model){
        List<Writer> all = writerRepository.findAll();
        model.addAttribute("writers",  all);
        return "/consultant/writer";
    }

    @GetMapping("/consultant/contract")
    public String getConsultantContractPage(Model model){
        List<Contract> all = contractRepository.findAll();
        model.addAttribute("contracts",  all);
        return "/consultant/contract";
    }

    @GetMapping("/consultant/book")
    public String getConsultantBookPage(Model model){
        List<Book> all = bookRepository.findAll();
        model.addAttribute("books",  all);
        return "/consultant/book";
    }

    @GetMapping("/consultant/order")
    public String getConsultantOrderPage(Model model){
        List<Order> all = orderRepository.findAll();
        model.addAttribute("orders",  all);
        return "/consultant/order";
    }




}
