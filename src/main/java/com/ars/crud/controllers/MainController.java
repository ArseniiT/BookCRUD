package com.ars.crud.controllers;

import com.ars.crud.models.Book;
import com.ars.crud.models.BookRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    BookRepo bookRepo;


    @RequestMapping("/")
    public ModelAndView doHome(@RequestParam(defaultValue = "0") int page){
        page = page - 1;
        if(page<0)
            page=0;
        ModelAndView mv = new ModelAndView("index");

        List<Book> books = bookRepo.findAll(new PageRequest(page,10)).getContent();
        mv.addObject("books", books);

        int maxPages = bookRepo.findAll(new PageRequest(page, 10)).getTotalPages();
        mv.addObject("maxPages", maxPages);

        return mv;
    }


    @RequestMapping( value = "/save", method = RequestMethod.POST)
    public ModelAndView doSave(@RequestParam("id") String id,
                               @RequestParam("author") String author,
                               @RequestParam("title") String title,
                               @RequestParam("description") String description,
                               @RequestParam("printYear") String printYear,
                               @RequestParam("readAlready") String readAlready){
        ModelAndView mv = new ModelAndView("redirect:/");
        Book book;
        if(!id.isEmpty()){
            book = bookRepo.findOne(Integer.parseInt(id));
        } else {
            book = new Book();
        }
        book.setAuthor(author);
        book.setTitle(title);
        book.setDescription(description);
        book.setPrintYear(Integer.parseInt(printYear));
        book.setReadAlready(Boolean.parseBoolean(readAlready));
        bookRepo.save(book);
        return mv;
    }

    @RequestMapping( value = "/readalready", method = RequestMethod.POST)
    public ModelAndView doSaveReadAlready(@RequestParam("id") String id){
        ModelAndView mv = new ModelAndView("redirect:/");

        Book book = bookRepo.findOne(Integer.parseInt(id));
        book.setReadAlready(true);
        bookRepo.save(book);

        return mv;
    }

    @RequestMapping( value = "/view/{id}", method = RequestMethod.GET)
    public ModelAndView doView(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("view");
        mv.addObject("book", bookRepo.findOne(id));
        return mv;
    }

    @RequestMapping( value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView doDelete(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("redirect:/");
        bookRepo.delete(id);
        return mv;
    }

    @RequestMapping( value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView doEdit(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("edit");
        mv.addObject("book", bookRepo.findOne(id));
        return mv;
    }

    @RequestMapping( value = "/edition/{id}", method = RequestMethod.GET)
    public ModelAndView doPublishing(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("edition");
        mv.addObject("book", bookRepo.findOne(id));
        return mv;
    }

}
