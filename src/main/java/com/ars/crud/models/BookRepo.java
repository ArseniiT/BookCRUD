package com.ars.crud.models;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookRepo extends JpaRepository<Book,Integer> {

    List<Book> findById(int id);
    List<Book> findByIdAndPrintYearLessThan(int id, int printYear);
    List<Book> findByIdAndPrintYearGreaterThan(int id, int printYear);
    List<Book> findByIdAndPrintYear(int id, int printYear);

    List<Book> findByAuthor(String author);
    List<Book> findByAuthorAndPrintYearLessThan(String author, int printYear);
    List<Book> findByAuthorAndPrintYearGreaterThan(String author, int printYear);
    List<Book> findByAuthorAndPrintYear(String author, int printYear);

    List<Book> findByTitle(String title);
    List<Book> findByTitleAndPrintYearLessThan(String title, int printYear);
    List<Book> findByTitleAndPrintYearGreaterThan(String title, int printYear);
    List<Book> findByTitleAndPrintYear(String title, int printYear);

    List<Book> findByIsbn(String isbn);
    List<Book> findByIsbnAndPrintYearLessThan(String isbn, int printYear);
    List<Book> findByIsbnAndPrintYearGreaterThan(String isbn, int printYear);
    List<Book> findByIsbnAndPrintYear(String isbn, int printYear);

    List<Book> findByDescription(String description);
    List<Book> findByDescriptionAndPrintYearLessThan(String description, int printYear);
    List<Book> findByDescriptionAndPrintYearGreaterThan(String description, int printYear);
    List<Book> findByDescriptionAndPrintYear(String description, int printYear);


    List<Book> findByPrintYear(int printYear);
    List<Book> findByPrintYearLessThan(int printYear);
    List<Book> findByPrintYearGreaterThan(int printYear);


}
