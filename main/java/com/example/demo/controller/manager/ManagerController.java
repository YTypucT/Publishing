package com.example.demo.controller.manager;

import com.example.demo.entity.*;
import com.example.demo.repostory.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Controller
public class ManagerController {

    @Autowired
    private WriterRepository writerRepository;

    @Autowired
    private ManuscriptRepository manuscriptRepository;

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private ContractRepository contractRepository;

    @GetMapping("/manager")
    public String getIndexPage(){
        return "/manager/manager";
    }

    @PostMapping("/manager/writer")
    public String addWriter(
            @RequestParam("id") Integer id,
            @RequestParam("fio") String fio,
            @RequestParam("address") String address,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone
    ){
        Writer writer = new Writer();
        writer.setNo_passport(id);
        writer.setFIO(fio);
        writer.setAddress(address);
        writer.setEmail(email);
        writer.setPhone(phone);
        writerRepository.save(writer);
        return "redirect:/manager/writer";
    }

    @GetMapping("/manager/writer")
    public String getConsultantWriterPage(Model model){
        List<Writer> all = writerRepository.findAll();
        model.addAttribute("writers",  all);
        return "/manager/write/writer";
    }

    @DeleteMapping("/manager/writer/{id}")
    public void deleteWriterById(
            @PathVariable("id") Integer id
    ){
        Writer byId = writerRepository.getById(id);
        writerRepository.delete(byId);
    }

    @PostMapping("/manager/manuscript")
    public String addManuscript(
            @RequestParam("name") String name,
            @RequestParam("text") String text,
            @RequestParam("genre") String genre,
            @RequestParam("count") String count,
            @RequestParam("status") String status
    ){
        Manuscript manuscript = new Manuscript();
        manuscript.setName_man(name);
        manuscript.setText(text);
        manuscript.setGenre(genre);
        manuscript.setCount_characters(count);
        manuscript.setStatus(status);

        manuscriptRepository.save(manuscript);
        return "redirect:/manager/manuscript";
    }

    @DeleteMapping("/manager/manuscript/{id}")
    public void deleteManuscriptById(
            @PathVariable("id") Integer id
    ){
        Manuscript byId = manuscriptRepository.getById(id);
        manuscriptRepository.delete(byId);
    }

    @GetMapping("/manager/manuscript")
    public String getConsultantManuspritPage(Model model){
        List<Manuscript> all = manuscriptRepository.findAll();
        model.addAttribute("manuscripts",  all);
        return "/manager/write/manuscript";
    }

    @GetMapping("/manager/client")
    public String getConsultantClientPage(Model model){
        List<Client> all = clientRepository.findAll();
        model.addAttribute("clients",  all);
        return "/manager/write/client";
    }

    @DeleteMapping("/manager/client/{id}")
    public void deleteClientById(
            @PathVariable("id") String id
    ){
        Client byId = clientRepository.findByNameClient(id);
        clientRepository.delete(byId);
    }

    @PostMapping("/manager/client")
    public String addNewClient(
            @RequestParam("client") String clientName,
            @RequestParam("address") String address,
            @RequestParam("contact") String contact,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone
    ){
        Client client = new Client();
        client.setName_client(clientName);
        client.setAddress(address);
        client.setContact(contact);
        client.setEmail(email);
        client.setPhone(phone);

        clientRepository.save(client);
        return "redirect:/manager/client";
    }

    @GetMapping("/manager/order")
    public String getConsultantOrderPage(Model model){
        List<Order> all = orderRepository.findAll();
        model.addAttribute("orders",  all);

        List<Client> clientRepositoryAll = clientRepository.findAll();
        model.addAttribute("clients", clientRepositoryAll);

        List<Book> bookRepositoryAll = bookRepository.findAll();
        model.addAttribute("books", bookRepositoryAll);
        return "/manager/write/order";
    }

    @DeleteMapping("/manager/order/{id}")
    public void deleteOrderById(
            @PathVariable("id") Integer id
    ){
        Order byId = orderRepository.getById(id);
        orderRepository.delete(byId);
    }

    @PostMapping("/manager/order")
    public String addNewOrder(
            @RequestParam("cost") Integer cost,
            @RequestParam("count") Integer count,
            @RequestParam("date") String date,
            @RequestParam("client") String client,
            @RequestParam("book[]") String[] book
    ){

        List<Book> bookList = new ArrayList<>();

        for (String name : book){
            Book book1 = bookRepository.findByNameBook(name);
            bookList.add(book1);
        }

        DateFormat format = new SimpleDateFormat("yyyy-MM-DD", Locale.ENGLISH);

        Date parsedDate = new Date();

        try {
            parsedDate = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        System.out.println(date); // Sat Jan 02 00:00:00 GMT 2010

        Order order = new Order();
        order.setCost(cost);
        order.setCount(count);
        order.setDate(parsedDate);
        order.setName_client(clientRepository.getById(client));
        order.setBookList(bookList);

        orderRepository.save(order);
        return "redirect:/manager/order";
    }

    @GetMapping("/manager/book")
    public String getConsultantBookPage(Model model){
        List<Book> all = bookRepository.findAll();
        model.addAttribute("books",  all);

        List<Manuscript> manuscriptRepositoryAll = manuscriptRepository.findAll();
        model.addAttribute("manus", manuscriptRepositoryAll);
        return "/manager/write/book";
    }

    @DeleteMapping("/manager/book/{id}")
    public void deleteBookById(
            @PathVariable("id") Integer id
    ){
        Book byId = bookRepository.getById(id);
        bookRepository.delete(byId);
    }

    @PostMapping("/manager/book")
    public String addNewBook(
            @RequestParam("name") String name,
            @RequestParam("cover") String cover,
            @RequestParam("color") String color,
            @RequestParam("start_price") Integer start_price,
            @RequestParam("price") Integer price,
            @RequestParam("count") Integer count,
            @RequestParam("year") Integer year,
            @RequestParam("man") Integer man
    ){
        Book book = new Book();
        book.setName_book(name);
        book.setCover(cover);
        book.setColor_print(color);
        book.setStart_price(start_price);
        book.setPrice(price);
        book.setCount(count);
        book.setYear_of_public(year);

        book.setCode_Man(manuscriptRepository.findById(man).get());

        bookRepository.save(book);

        return "redirect:/manager/book";
    }

    @GetMapping("/manager/contract")
    public String getConsultantContractPage(Model model){
        List<Contract> all = contractRepository.findAll();
        model.addAttribute("contract",  all);
        return "/manager/write/contract";
    }

    @DeleteMapping("/manager/contract/{id}")
    public void deleteContractById(
            @PathVariable("id") Integer id
    ){
        Contract byId = contractRepository.getById(id);
        contractRepository.delete(byId);
    }

    @PostMapping("/manager/contract")
    public String addContract(
            @RequestParam("№") Integer No,
            @RequestParam("book") String book,
            @RequestParam("date") String date,
            @RequestParam("duration") Integer duration,
            @RequestParam("status") String status,
            @RequestParam("date_dis") String date_dis
    ){
        DateFormat format = new SimpleDateFormat("yyyy-MM-DD", Locale.ENGLISH);

        Date parsedDate = new Date();

        try {
            parsedDate = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Date parsedDate_2 = new Date();

        try {
            parsedDate_2 = format.parse(date_dis);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Contract contract = new Contract();
        contract.setNo_contract(No);
        contract.setCode_book(bookRepository.findByNameBook(book));
        contract.setStart_date(parsedDate);
        contract.setDuration(duration);
        contract.setDissolve(status);
        contract.setStart_date(parsedDate_2);

        contractRepository.save(contract);
        return "redirect:/manager/contract";
    }

}
