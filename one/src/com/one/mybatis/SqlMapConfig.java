package com.one.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "com/one/mybatis/Configuration.xml";
		
			try {
				Reader reader = Resources.getResourceAsReader(resource);
//				file I/O: 파일을 읽는 것. 한번에 읽을 수 없어서 조금씩 읽어서 reader라는곳에 담는다.
				
				if (sqlSessionFactory == null){
					sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
}
