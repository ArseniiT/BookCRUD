package com.ars.crud.service;

import com.ars.crud.models.Book;
import com.ars.crud.models.BookRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BookServiceImpl {

    private BookRepo bookRepo;

    @Autowired
    public BookServiceImpl(BookRepo bookRepo) {
        this.bookRepo = bookRepo;
    }


    public Page<Book> listAllByPage(Pageable pageable) {
        return bookRepo.findAll(pageable);
    }
}
