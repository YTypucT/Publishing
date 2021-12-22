package com.example.demo.controller.manager;

import com.example.demo.entity.*;
import com.example.demo.repostory.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.net.http.HttpResponse;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ManagerController {

    private final WriterRepository writerRepository;
    private final ManuscriptRepository manuscriptRepository;
    private final ClientRepository clientRepository;
    private final OrderRepository orderRepository;
    private final BookRepository bookRepository;
    private final ContractRepository contractRepository;
    private final StructureOfOrderRepository structureOfOrderRepository;

    public ManagerController(WriterRepository writerRepository, ManuscriptRepository manuscriptRepository, ClientRepository clientRepository, OrderRepository orderRepository, BookRepository bookRepository, ContractRepository contractRepository, StructureOfOrderRepository structureOfOrderRepository) {
        this.writerRepository = writerRepository;
        this.manuscriptRepository = manuscriptRepository;
        this.clientRepository = clientRepository;
        this.orderRepository = orderRepository;
        this.bookRepository = bookRepository;
        this.contractRepository = contractRepository;
        this.structureOfOrderRepository = structureOfOrderRepository;
    }

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
            @RequestParam("genre") String genre,
            @RequestParam("count") String count,
            @RequestParam("status") String status,
            @RequestParam("writer") String[] writers
            ){

        List<Writer> writerList = new ArrayList<>();
        for(String str: writers){
            System.out.println(str);
            Writer writer = writerRepository.findById(Integer.parseInt(str)).get();
            writerList.add(writer);
        }
        Manuscript manuscript = new Manuscript();
        manuscript.setName_man(name);
//        manuscript.setText(text);
        manuscript.setGenre(genre);
        manuscript.setCount_characters(count);
        manuscript.setStatus(status);
        manuscript.setWriterList(writerList);

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
        List<Writer> writers = writerRepository.findAll();
        model.addAttribute("writers",  writers);
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
        System.out.println(id);
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
//            @RequestParam("cost") Integer cost,
            @RequestParam("date") String date,
            @RequestParam("client") String client
    ){

//        List<Book> bookList = new ArrayList<>();
//
//        for (String name : book){
//            Book book1 = bookRepository.findByNameBook(name);
//            bookList.add(book1);
//        }

        DateFormat format = new SimpleDateFormat("yyyy-MM-DD", Locale.ENGLISH);

        Date parsedDate = new Date();

        try {
            parsedDate = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        System.out.println(date); // Sat Jan 02 00:00:00 GMT 2010

        Order order = new Order();
//        order.setCost(cost);
//        order.setCount(count);
        order.setDate(parsedDate);
        order.setName_client(clientRepository.getById(client));
//        order.setBookList(bookList);

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
//            @RequestParam("start_price") Integer start_price,
            @RequestParam("price") Integer price,
            @RequestParam("count") Integer count,
            @RequestParam("year") Integer year,
            @RequestParam("man") Integer man
    ){
        Book book = new Book();
        book.setName_book(name);
        book.setCover(cover);
        book.setColor_print(color);
//        book.setStart_price(start_price);
        book.setPrice(price);
        book.setCount(count);
        book.setYear_of_public(year);

        book.setCode_Man(manuscriptRepository.findById(man).get());

        bookRepository.save(book);

        return "redirect:/manager/book";
    }

    @GetMapping("/manager/contract")
    public String getConsultantContractPage(Model model){
        List<Contract> contracts = contractRepository.findAll();
        List<Client> clients = clientRepository.findAll();
        List<Book> books = bookRepository.findAll();
        model.addAttribute("contracts",  contracts);
        model.addAttribute("clients",  clients);
        model.addAttribute("books",  books);
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
            @RequestParam("status") String status
    ){
        DateFormat format = new SimpleDateFormat("yyyy-MM-DD", Locale.ENGLISH);

        Date startDate = new Date();

        try {
            startDate = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        Calendar myCal = new GregorianCalendar();
        myCal.setTime(startDate);
        myCal.add(Calendar.YEAR, duration);
        Date parsedDate_dis = myCal.getTime();

        Contract contract = new Contract();
        contract.setNo_contract(No);
        contract.setCode_book(bookRepository.findByNameBook(book));
        contract.setStart_date(startDate);
        contract.setDuration(duration);
        contract.setDissolve(status);
        contract.setDissolve_date(parsedDate_dis);

        contractRepository.save(contract);
        return "redirect:/manager/contract";
    }


    @GetMapping("/manager/structure_of_order/{id}")
    public String getConsultantStructureOfOrderPage(Model model,  @PathVariable("id") Integer id){

        Order order = orderRepository.findById(id).get();
        model.addAttribute("order",  order);

        List<Book> bookRepositoryAll = bookRepository.findAll();
        model.addAttribute("books", bookRepositoryAll);

//        List<Client> clientRepositoryAll = clientRepository.findAll();
//        model.addAttribute("clients", clientRepositoryAll);
//
//        List<Book> bookRepositoryAll = bookRepository.findAll();
//        model.addAttribute("books", bookRepositoryAll);
        return "/manager/write/structure_of_orders";
    }

    @PostMapping("/manager/structure_of_order")
    public String AddStructure (
            @RequestParam("book") Integer book,
//            @RequestParam("cost") Integer cost,
            @RequestParam("count") Integer count,
            @RequestParam("id") Integer id
    ){
        Structure_of_order structure_of_order = new Structure_of_order();
        structure_of_order.setId(new Structure_of_order_id(book, id));
        structure_of_order.setCost(bookRepository.getById(book).getPrice());
        structure_of_order.setCount(count);
        structure_of_order.setBook(bookRepository.getById(book));
        structure_of_order.setOrder(orderRepository.getById(id));

        structureOfOrderRepository.save(structure_of_order);
        return "redirect:/manager/structure_of_order/"+id;
    }

    @DeleteMapping("/manager/structure_of_order/{data}")
    public ResponseEntity DeleteStructure(
            @PathVariable(name = "data") String data
    ){
        String[] param = data.split("@");
        Integer orderId = Integer.parseInt(param[0]);
        Integer bookId = Integer.parseInt(param[1]);


        Structure_of_order_id structure_of_order_id = new Structure_of_order_id(bookId, orderId);
        Structure_of_order structure_of_orderByStructure_of_order_id = structureOfOrderRepository.findById(structure_of_order_id).get();
        structureOfOrderRepository.delete(structureOfOrderRepository.getById(structure_of_order_id));
        return new ResponseEntity<>("Ok", HttpStatus.OK);
    }


}


