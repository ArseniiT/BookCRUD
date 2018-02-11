package com.ars.crud.controllers;

import com.ars.crud.models.Book;
import com.ars.crud.models.BookRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class SearchController {

    @Autowired
    BookRepo bookRepo;

    @RequestMapping( value = "searchid", method = RequestMethod.POST)
    public ModelAndView doSearchId(@RequestParam("keyword") String keyword){
        ModelAndView mv = new ModelAndView("index");

        Book book = bookRepo.findOne(Integer.parseInt(keyword));
        List<Book> books = new ArrayList<>();
        books.add(book);

        return mv;
    }

    @RequestMapping( value = "search", method = RequestMethod.POST)
    public ModelAndView doSearchAuthor(@RequestParam("keyword") String keyword,
                                       @RequestParam("keywordType") String keywordType,
                                       @RequestParam("year") String year,
                                       @RequestParam("yearType") String yearType

                                       ){
        ModelAndView mv = new ModelAndView("index");
        List<Book> books = null ;


        if(!keyword.equals("") && !year.equals("")){
                if(keywordType.equals("id") && yearType.equals("during"))
                    books = bookRepo.findByIdAndPrintYear(Integer.parseInt(keyword), Integer.parseInt(year));
                if(keywordType.equals("id") && yearType.equals("less"))
                    books = bookRepo.findByIdAndPrintYearLessThan(Integer.parseInt(keyword), Integer.parseInt(year));
                if(keywordType.equals("id") && yearType.equals("greater"))
                    books = bookRepo.findByIdAndPrintYearGreaterThan(Integer.parseInt(keyword), Integer.parseInt(year));


                if(keywordType.equals("author") && yearType.equals("during"))
                    books = bookRepo.findByAuthorAndPrintYear(keyword, Integer.parseInt(year));
                if(keywordType.equals("author") && yearType.equals("less"))
                    books = bookRepo.findByAuthorAndPrintYearLessThan(keyword, Integer.parseInt(year));
                if(keywordType.equals("author") && yearType.equals("greater"))
                    books = bookRepo.findByAuthorAndPrintYearGreaterThan(keyword, Integer.parseInt(year));

                if(keywordType.equals("title") && yearType.equals("during"))
                    books = bookRepo.findByTitleAndPrintYear(keyword, Integer.parseInt(year));
                if(keywordType.equals("title") && yearType.equals("less"))
                    books = bookRepo.findByTitleAndPrintYearLessThan(keyword, Integer.parseInt(year));
                if(keywordType.equals("title") && yearType.equals("greater"))
                    books = bookRepo.findByTitleAndPrintYearGreaterThan(keyword, Integer.parseInt(year));

                if(keywordType.equals("description") && yearType.equals("during"))
                    books = bookRepo.findByDescriptionAndPrintYear(keyword, Integer.parseInt(year));
                if(keywordType.equals("description") && yearType.equals("less"))
                    books = bookRepo.findByDescriptionAndPrintYearLessThan(keyword, Integer.parseInt(year));
                if(keywordType.equals("description") && yearType.equals("greater"))
                    books = bookRepo.findByDescriptionAndPrintYearGreaterThan(keyword, Integer.parseInt(year));


                if(keywordType.equals("isbn") && yearType.equals("during"))
                    books = bookRepo.findByIsbnAndPrintYear(keyword, Integer.parseInt(year));
                if(keywordType.equals("isbn") && yearType.equals("less"))
                    books = bookRepo.findByIsbnAndPrintYearLessThan(keyword, Integer.parseInt(year));
                if(keywordType.equals("isbn") && yearType.equals("greater"))
                    books = bookRepo.findByIsbnAndPrintYearGreaterThan(keyword, Integer.parseInt(year));
        }

        if(!keyword.equals("") && year.equals("")){
            if(keywordType.equals("id"))
                books = bookRepo.findById(Integer.parseInt(keyword));

            if(keywordType.equals("author"))
                books = bookRepo.findByAuthor(keyword);

            if(keywordType.equals("title"))
                books = bookRepo.findByTitle(keyword);

            if(keywordType.equals("description"))
                books = bookRepo.findByDescription(keyword);

            if(keywordType.equals("isbn"))
                books = bookRepo.findByIsbn(keyword);
        }

        if(keyword.equals("") && !year.equals("")){
            if(yearType.equals("during"))
                books = bookRepo.findByPrintYear(Integer.parseInt(year));
            if(yearType.equals("less"))
                books = bookRepo.findByPrintYearLessThan(Integer.parseInt(year));
            if(yearType.equals("greater"))
                books = bookRepo.findByPrintYearGreaterThan(Integer.parseInt(year));
        }


        mv.addObject("books", books);

        return mv;
    }

}
