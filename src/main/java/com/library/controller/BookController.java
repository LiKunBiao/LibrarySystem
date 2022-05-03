package com.library.controller;

import com.github.pagehelper.PageInfo;
import com.library.bean.BookInfo;
import com.library.bean.LendInfo;
import com.library.bean.LendLog;
import com.library.bean.Read;
import com.library.service.BookService;
import com.library.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class BookController {

    @Autowired
    private BookService bookService;

    @Autowired
    private ReaderService readerService;

    //全部图书
    @RequestMapping("/admin_books")
    public ModelAndView toAdminBooks(
            @RequestParam(name="page",required = true,defaultValue = "1") int page,
            @RequestParam(name="size",required = true,defaultValue = "8") int size) {
        List<BookInfo> allBooks = bookService.getAllBooks(page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageBooks = new PageInfo(allBooks);
        //向请求域共享数据
        ModelAndView mav = new ModelAndView();
        mav.addObject("pageBooks", pageBooks);
        //设置视图，实现页面跳转
        mav.setViewName("admin_books");
        return mav;
    }

    //添加图书页面
    @RequestMapping("/admin_book_add")
    public String toAdminBookAdd() {
        return "admin_book_add";
    }

    //添加图书逻辑
    @RequestMapping("/addBook")
    @ResponseBody
    public Object addBook(BookInfo bookInfo){
        int result = bookService.addBook(bookInfo);
        HashMap<String, String> res = new HashMap<>();
        res.put("stateCode", result+"");
        return res;
    }

    //根据ID值查找图书
    @RequestMapping("/selectBookByID")
    public ModelAndView selectBookByID(String bookId, String page, String size, String name, String author){
        Long id = Long.parseLong(bookId);
        BookInfo book = bookService.selectBookByID(id);
        ModelAndView mav = new ModelAndView();
        mav.addObject("book", book);
        mav.addObject("page", page);
        mav.addObject("size", size);
        mav.addObject("name", name);
        mav.addObject("author", author);
        mav.setViewName("admin_book_update");
        return mav;
    }

    //修改图书逻辑
    @RequestMapping("/updateBook")
    @ResponseBody
    public Object updateBook(BookInfo bookInfo){
        int result = bookService.updateBook(bookInfo);
        HashMap<String, String> res = new HashMap<>();
        res.put("stateCode", result+"");
        return res;
    }

    //删除图书逻辑
    @RequestMapping("/deleteBook")
    @ResponseBody
    public Object deleteBook(String bookId){
        long id = Long.parseLong(bookId);
        int result = bookService.deleteBook(id);
        HashMap<String, String> res = new HashMap<>();
        res.put("stateCode", result+"");
        return res;
    }

    //删除选中图书
    @RequestMapping("/deleteSelectedbooks")
    public String deleteSelectedbooks(String[] id, String page, String size, String name, String author) {
        bookService.deleteSelectedbooks(id);
        return "redirect:/seleteBooks?page=" + page + "&size=" + size + "&name=" + name + "&author=" + author;
    }

    //查询图书
    @RequestMapping("/seleteBooks")
    public ModelAndView seleteBooks(
            String name,
            String author,
            @RequestParam(name="page",required = true,defaultValue = "1") int page,
            @RequestParam(name="size",required = true,defaultValue = "8") int size) {
        List<BookInfo> selectBooks = bookService.selectBooks(name, author, page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageBooks = new PageInfo(selectBooks);
        //向请求域共享数据
        ModelAndView mav = new ModelAndView();
        mav.addObject("pageBooks", pageBooks);
        mav.addObject("name", name);
        mav.addObject("author", author);

        //设置视图，实现页面跳转
        mav.setViewName("admin_books");
        return mav;
    }

    //图书详细信息
    @RequestMapping("/admin_book_detail")
    public ModelAndView toDetailBook(String bookId, String page, String size, String name, String author) {
        Long id = Long.parseLong(bookId);
        BookInfo book = bookService.selectBookByID(id);
        ModelAndView mav = new ModelAndView();
        mav.addObject("book", book);
        mav.addObject("page", page);
        mav.addObject("size", size);
        mav.addObject("name", name);
        mav.addObject("author", author);
        mav.setViewName("admin_book_detail");
        return mav;
    }

    //重置密码页面
    @RequestMapping("/adminPasswordUpdate")
    public String readerPasswordUpdate() {
        return "admin_password_update";
    }

    //重置密码
    @RequestMapping("/adminResetPassword")
    @ResponseBody
    public Object adminResetPassword(String oldPassword, String newPassword, HttpServletRequest request){
        String username = (String)request.getSession().getAttribute("username");//只是为了复用代码
        int result = bookService.resetPassword(oldPassword, newPassword, username);
        HashMap<String, Object> res = new HashMap<>();
        res.put("stateCode", result+"");
        return res;
    }

    //读者管理，查找读者信息(包括密码，isBan)
    @RequestMapping("/selectAllReader")
    public String selectAllReader(Model model) {
        List<Read> reads = bookService.selectAllReader();
        model.addAttribute("reads", reads);
        return "admin_readers";
    }

    //读者管理，更新isBan
    @RequestMapping("/updateIsBan")
    @ResponseBody
    public Object updateIsBan(String username, String isBan) {
        int i = Integer.parseInt(isBan);
        int result = bookService.updateIsBan(username, i);
        HashMap<String, Object> res = new HashMap<>();
        res.put("stateCode", result+"");
        return res;
    }
}
