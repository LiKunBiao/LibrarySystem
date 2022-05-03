import com.library.bean.BookInfo;
import com.library.mapper.BookInfoMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class test {
    @Test
    public void testInsertUser() throws IOException {
        InputStream is = Resources.getResourceAsStream("applicationContext.xml");
        SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
        SqlSessionFactory sqlSessionFactory = sqlSessionFactoryBuilder.build(is);
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        //通过代理模式创建UserMapper接口的代理实现类对象
        BookInfoMapper userMapper = sqlSession.getMapper(BookInfoMapper.class);
        //调用UserMapper接口中的方法，就可以根据UserMapper的全类名匹配元素文件，通过调用的方法名匹配映射文件中的SQL标签，并执行标签中的SQL语句
//        List<BookInfo> result = userMapper.getAllBooks();
        //提交事务
        //sqlSession.commit();
//        System.out.println("result:" + result);
    }
}
