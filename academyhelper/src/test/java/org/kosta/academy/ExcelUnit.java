package org.kosta.academy;

import java.io.FileInputStream;
import java.io.IOException;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring-model.xml")
public class ExcelUnit {
	@Test
	public void insertTest() throws IOException {
		FileInputStream file = new FileInputStream("C:\\java-kosta\\test2.xlsx");
		XSSFWorkbook workBook = new XSSFWorkbook(file);
		int rowindex=0;
		int columnindex=0;
		//시트수를 getSheetAt()안에 넣어준다.
		//시트수가 한개인경우에는 0을 입력한다.
		//시트수가 2개이상이라면 for문을 더돌려준다.
		XSSFSheet sheet = workBook.getSheetAt(0);
		//행의 수를 리턴받는다.
		int rows = sheet.getPhysicalNumberOfRows();
		for(rowindex=0;rowindex<rows;rowindex++) {
			//해당 행을 읽는다.
			XSSFRow row= sheet.getRow(rowindex);
			if(row != null) {
				//셀의 수를 리턴받는다.
				int cells = row.getPhysicalNumberOfCells();
				String[] value = new String[cells];
				for(columnindex=0;columnindex<=cells;columnindex++) {
					//해당 셀을 읽는다.
					XSSFCell cell = row.getCell(columnindex);
					//해당 셀이 빈값이라면
					if(cell==null) {
						continue;
					}else if(cell.getCellType()==1){
						value[columnindex] = cell.getStringCellValue();
					}else if(cell.getCellType()==0) {
						value[columnindex] = String.valueOf(cell).substring(0,String.valueOf(cell).length()-2);
					}
				}
				for(int i=0; i<value.length;i++) {
					System.out.println(value[i]);
				}
				System.out.println("\n");
			}
		}
	}
}
