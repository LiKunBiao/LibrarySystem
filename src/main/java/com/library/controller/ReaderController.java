package com.library.controller;

import com.github.pagehelper.PageInfo;
import com.library.bean.BookInfo;
import com.library.bean.LendInfo;
import com.library.bean.LendLog;
import com.library.bean.ReaderInfo;
import com.library.service.BookService;
import com.library.service.ReaderService;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class ReaderController {

    @Autowired
    private BookService bookService;

    @Autowired
    private ReaderService readerService;

    //全部图书
    @RequestMapping("/reader_books")
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
        mav.setViewName("reader_books");
        return mav;
    }

    //查询图书
    @RequestMapping("/reader_seleteBooks")
    public ModelAndView readerSeleteBooks(
            String name,
            String author,
            @RequestParam(name="page",required = true,defaultValue = "1") int page,
            @RequestParam(name="size",required = true,defaultValue = "8") int size,
            HttpServletRequest request) {
        List<BookInfo> selectBooks = bookService.selectBooks(name, author, page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageBooks = new PageInfo(selectBooks);
        //向请求域共享数据
        ModelAndView mav = new ModelAndView();
        mav.addObject("pageBooks", pageBooks);
        mav.addObject("name", name);
        mav.addObject("author", author);
        //查找LendInfo表
        String readId = (String)request.getSession().getAttribute("readId");
        List<LendInfo> lendInfos = readerService.allLends(readId);
        List<Long> lendList = new ArrayList<>();
        for(LendInfo lendInfo : lendInfos) {
            if(lendInfo.getBackDate() == null) {
                lendList.add(lendInfo.getBookId());
            }
        }
        mav.addObject("lendList", lendList);
        //设置视图，实现页面跳转
        mav.setViewName("reader_books");
        return mav;
    }
    //图书详细信息
    @RequestMapping("/reader_book_detail")
    public ModelAndView toDetailBook(String bookId, String page, String size, String name, String author) {
        Long id = Long.parseLong(bookId);
        BookInfo book = bookService.selectBookByID(id);
        ModelAndView mav = new ModelAndView();
        mav.addObject("book", book);
        mav.addObject("page", page);
        mav.addObject("size", size);
        mav.addObject("name", name);
        mav.addObject("author", author);
        mav.setViewName("reader_book_detail");
        return mav;
    }

    //根据用户名查找读者selectReaderByUsername
    @RequestMapping("/selectReaderByReadId")
    public String selectReaderByUsername(HttpServletRequest request, Model model) {
        String readId = (String)request.getSession().getAttribute("readId");
        ReaderInfo readerInfo = readerService.selectReaderByReadId(readId);
        model.addAttribute("readerInfo", readerInfo);
        return "reader_update";
    }

    //修改逻辑
    @RequestMapping("/reverseReader")
    @ResponseBody
    public Object reverseReader(ReaderInfo readerInfo) {
        int stateCode = readerService.reverseReader(readerInfo);
        HashMap<String, Object> res = new HashMap<>();
        res.put("stateCode", stateCode+"");
        return res;
    }

    //图书借阅
    @RequestMapping("/lendBook")
    public String lendBook(String bookId, String page, String size, String name, String author, Model model, HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        LendInfo lendInfo = new LendInfo();
        lendInfo.setBookId(Long.parseLong(bookId));
        lendInfo.setReadId((String)request.getSession().getAttribute("readId"));
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        lendInfo.setLendDate(simpleDateFormat.format(new Date()));
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("name", name);
        model.addAttribute("author", author);
        readerService.lendBook(lendInfo);
        return "forward:/reader_seleteBooks";
    }

    //图书归还
    @RequestMapping("/returnBook")
    public String returnBook(String bookId, String page, String size, String name,
                             String author, Model model, HttpServletRequest request)
    {
        LendInfo lendInfo = new LendInfo();
        lendInfo.setBookId(Long.parseLong(bookId));
        lendInfo.setReadId((String)request.getSession().getAttribute("readId"));
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        lendInfo.setBackDate(simpleDateFormat.format(new Date()));
        readerService.returnBook(lendInfo);
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("name", name);
        model.addAttribute("author", author);
        return "forward:/reader_seleteBooks";
    }

    //个人借还日志
    @RequestMapping("/lendBookLog")
    public String lendBookLog(Model model, HttpServletRequest request) throws ParseException {
        String readId = (String)request.getSession().getAttribute("readId");
        List<LendLog> lendLogs = readerService.lendBookLog(readId);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(LendLog lendLog : lendLogs) {
            long lTime = simpleDateFormat.parse(lendLog.getLendDate()).getTime();
            lendLog.setLendDate(simpleDateFormat.format(lTime));
            if(lendLog.getBackDate() != null) {
                long bTime = simpleDateFormat.parse(lendLog.getBackDate()).getTime();
                lendLog.setBackDate(simpleDateFormat.format(bTime));
            }
        }
        model.addAttribute("lendLogs", lendLogs);
        return "reader_lend_log";
    }

    @RequestMapping("/returnBook2")
    public String returnBook2(String bookId, HttpSession session) {
        String readId = (String)session.getAttribute("readId");
        LendInfo lendInfo = new LendInfo();
        lendInfo.setBookId(Long.parseLong(bookId));
        lendInfo.setReadId((String)session.getAttribute("readId"));
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        lendInfo.setBackDate(simpleDateFormat.format(new Date()));
        readerService.returnBook(lendInfo);
        return "forward:/lendBookLog";
    }

    //重置密码页面
    @RequestMapping("/readerPasswordUpdate")
    public String readerPasswordUpdate() {
        return "reader_password_update";
    }

    //重置密码
    @RequestMapping("/readerResetPassword")
    @ResponseBody
    public Object readerResetPassword(String oldPassword, String newPassword, HttpServletRequest request){
        String readId = (String)request.getSession().getAttribute("readId");
        int result = bookService.resetPassword(oldPassword, newPassword, readId);
        HashMap<String, Object> res = new HashMap<>();
        res.put("stateCode", result+"");
        return res;
    }
}
