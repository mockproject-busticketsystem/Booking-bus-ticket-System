package dao;

import java.math.BigDecimal;
import java.security.Timestamp;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import connect.ConnectionUtils;
import connect.DBConnect;
import models.ChuyenDi;
import models.KhachHang;
import models.NhanVien;
import models.TaiKhoan;
import models.TuyenDi;
import models.VeXe;

public class VexeDAOImplement implements VexeDAO{

	@Override
	public ArrayList<VeXe> getMaghe(Integer idChuyen,  LocalDate ngayDi) {
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT MaGhe FROM vexe where IdChuyen = ? and NgayDi = ?";
		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, idChuyen);
			ps.setDate(2, Date.valueOf(ngayDi));
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				VeXe vexe = new VeXe();
				vexe.setMaGhe(rs.getString("MaGhe"));
				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}

//	@Override
//	public void Booking_Ve(VeXe veXe, String[] ghe) {
//		// TODO Auto-generated method stub
//	
//			Connection connection = null;
//			try {
//				connection = DBConnect.getMySQLConnection();
//				String sql = "";
//				for(int i = 0 ;i< ghe.length;i++) {
//					sql = "Insert into vexe values(?, ?, ?, ?, 0)";
//				}				
//				PreparedStatement ps = connection.prepareStatement(sql);
//				ps.setString(1, veXe.getcMND());
//				ps.setInt(2, veXe.getChuyenDi().getiD());
//				LocalDate ngaydi = veXe.getNgayDi();
//				ps.setDate(3, java.sql.Date.valueOf(ngaydi));
//				ps.setString(4, veXe.getMaGhe());		
//				System.out.println(ps.executeUpdate());
//				System.out.println("insert ve xe: " + ps.executeUpdate());
//				ps.executeUpdate();
////				return 1;
//			} catch (Exception ex) {
//				ex.printStackTrace();
//			}
////			return 0;
//		}
	@Override
	public ArrayList<VeXe> viewAllTicketCusTom(String cMND)
	{
		ArrayList<VeXe> array = new ArrayList<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			String query="SELECT * FROM vexe INNER JOIN chuyendi ON vexe.IdChuyen=chuyendi.id where vexe.CMND = ?" ;
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setString(1, cMND);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				int iDChuyen = rs.getInt("IdChuyen");
				String maTuyen = rs.getString("MaTuyen");
				LocalTime GioDi = LocalTime.parse(rs.getString("GioDi"));
				LocalTime GioDen = LocalTime.parse(rs.getString("GioDen"));
				LocalDate ngayDi = LocalDate.parse(rs.getString("NgayDi"));
				String maGhe = rs.getString("MaGhe");
				BigDecimal donGia = rs.getBigDecimal("DonGia");
				Boolean status = rs.getBoolean("Status");
				String ngaydiodat = rs.getString("NgayGioDat");
				ChuyenDi chuyenDi = new ChuyenDi(iDChuyen,maTuyen,GioDi,GioDen,donGia);
				VeXe veXe = new VeXe(cMND,ngayDi,maGhe,donGia,status,chuyenDi,ngaydiodat);
				array.add(veXe);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;
		
	}
	@Override
	public ArrayList<VeXe> viewAllTicketCusTomNotChanage(String cMND)
	{
		ArrayList<VeXe> array = new ArrayList<>();
		try {
			
			Connection conn = ConnectionUtils.getConnection();
			String query="SELECT * FROM vexe INNER JOIN chuyendi ON vexe.IdChuyen=chuyendi.id "
					+ "INNER JOIN tuyendi ON chuyendi.MaTuyen=tuyendi.Id  where vexe.CMND = ? and Status = ?";
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setString(1, cMND);
			ps.setBoolean(2, true);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				int iDChuyen = rs.getInt("IdChuyen");
				String diaDiemDi = rs.getString("DiaDiemDi");
				String diaDiemDen = rs.getString("DiaDiemDen");
				String hangDoi = rs.getString("HangDoi");
				String maTuyen = rs.getString("MaTuyen");
				LocalTime GioDi = LocalTime.parse(rs.getString("GioDi"));
				LocalTime GioDen = LocalTime.parse(rs.getString("GioDen"));
				LocalDate ngayDi = LocalDate.parse(rs.getString("NgayDi"));
				String maGhe = rs.getString("MaGhe");
				BigDecimal donGia = rs.getBigDecimal("DonGia");
				Boolean status = rs.getBoolean("Status");
				String ngaygiodat = rs.getString("NgayGioDat");
				TuyenDi tuyenDi = new TuyenDi(maTuyen,diaDiemDi,diaDiemDen,hangDoi);
				ChuyenDi chuyenDi = new ChuyenDi(iDChuyen,GioDi,GioDen,donGia,tuyenDi);
				VeXe veXe = new VeXe(cMND,ngayDi,maGhe,donGia,status,chuyenDi,ngaygiodat);
				array.add(veXe);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;
	}
	@Override
	public ArrayList<VeXe> viewAllTicketCusTomChanage(String cMND)
	{
		ArrayList<VeXe> array =  new ArrayList<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			String query="SELECT * FROM vexe INNER JOIN chuyendi ON vexe.IdChuyen=chuyendi.id "
					+ "INNER JOIN tuyendi ON chuyendi.MaTuyen=tuyendi.Id  where vexe.CMND = ? and Status = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, cMND);
			ps.setBoolean(2, false);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				int iDChuyen = rs.getInt("IdChuyen");
				String diaDiemDi = rs.getString("DiaDiemDi");
				String diaDiemDen = rs.getString("DiaDiemDen");
				String hangDoi = rs.getString("HangDoi");
				String maTuyen = rs.getString("MaTuyen");
				LocalTime GioDi = LocalTime.parse(rs.getString("GioDi"));
				LocalTime GioDen = LocalTime.parse(rs.getString("GioDen"));
				LocalDate ngayDi = LocalDate.parse(rs.getString("NgayDi"));
//				 DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//				 LocalDateTime ngaygio_dat = LocalDateTime.parse((rs.getTimestamp("NgayGioDat")).toString(), inputFormatter);
//				System.out.println(ngaygio_dat);
				String ngaygiodat = rs.getString("NgayGioDat");
			
				String maGhe = rs.getString("MaGhe");
				BigDecimal donGia = rs.getBigDecimal("DonGia");
				Boolean status = rs.getBoolean("Status");
				TuyenDi tuyenDi = new TuyenDi(maTuyen,diaDiemDi,diaDiemDen,hangDoi);
				ChuyenDi chuyenDi = new ChuyenDi(iDChuyen,GioDi,GioDen,donGia,tuyenDi);
				VeXe veXe = new VeXe(cMND,ngayDi,maGhe,donGia,status,chuyenDi,ngaygiodat);
				array.add(veXe);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;
	}
	public ArrayList<VeXe> getAllInformationVeXe(String value,String count,String value2,String count2)
	{// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT IdChuyen,HangDoi,NgayDi,GioDi,DiaDiemDen,DiaDiemDi,DonGia,count(IdChuyen) as soluong FROM vexe,chuyendi,tuyendi where vexe.IdChuyen=chuyendi.id and tuyendi.Id=chuyendi.MaTuyen";
		if(count.equals("1")) {
			sql=sql+" and IdChuyen='"+value+"'";
		
		}
		if(count.equals("2")) {
			sql=sql+" and NgayDi='"+value+"'";
		}
		if(count.equals("3")) {
			sql=sql+" and GioDi='"+value+"'";
		}
		if(count.equals("4")) {
			sql=sql+" and DiaDiemDi='"+value+"'";
		}
		if(count.equals("5")) {
			sql=sql+" and DiaDiemDen='"+value+"'";
		}
		if(count.equals("6")) {
			sql=sql+" and DonGia='"+value+"'";
		}
		if(count.equals("7")) {
			sql=sql+" and HangDoi='"+value+"'";
		}
//2
		if(count2.equals("21")) {
			sql=sql+" and IdChuyen='"+value2+"'";
		
		}
		if(count2.equals("22")) {
			sql=sql+" and NgayDi='"+value2+"'";
		}
		if(count2.equals("23")) {
			sql=sql+" and GioDi='"+value2+"'";
		}
		if(count2.equals("24")) {
			sql=sql+" and DiaDiemDi='"+value2+"'";
		}
		if(count2.equals("25")) {
			sql=sql+" and DiaDiemDen='"+value2+"'";
		}
		if(count2.equals("26")) {
			sql=sql+" and DonGia='"+value2+"'";
		}
		if(count2.equals("27")) {
			sql=sql+" and HangDoi='"+value2+"'";
		}
		
		
        

		sql=sql+" group by NgayDi,IdChuyen,GioDi;";



		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				LocalDate date= LocalDate.parse(rs.getString("NgayDi"));
				LocalTime time= LocalTime.parse(rs.getString("GioDi"));
				VeXe vexe = new VeXe();
				vexe.setGioDi(time);
				vexe.setNgayDi(date);
				vexe.setDiaDiemDen(rs.getString("DiaDiemDen"));
				vexe.setiDChuyen(rs.getInt("iDChuyen"));
				vexe.setDiaDiemDi(rs.getString("DiaDiemDi"));
				vexe.setDonGia(rs.getBigDecimal("DonGia"));
				vexe.setSoLuong(rs.getInt("soluong"));
				vexe.setHangDoi(rs.getString("HangDoi"));
				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}





	//filter distinct
	public ArrayList<VeXe> VeXedistinctIDChuyen()
	{// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT DISTINCT IdChuyen FROM vexe,chuyendi,tuyendi where vexe.IdChuyen=chuyendi.id and tuyendi.Id=chuyendi.MaTuyen group by NgayDi,IdChuyen,GioDi;";
		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{


				VeXe vexe = new VeXe();

				vexe.setiDChuyen(rs.getInt("iDChuyen"));

				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}

	public ArrayList<VeXe> VeXedistinctDate()
	{// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT DISTINCT NgayDi FROM vexe,chuyendi,tuyendi where vexe.IdChuyen=chuyendi.id and tuyendi.Id=chuyendi.MaTuyen group by NgayDi,IdChuyen,GioDi;";
		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				LocalDate date= LocalDate.parse(rs.getString("NgayDi"));

				VeXe vexe = new VeXe();

				vexe.setNgayDi(date);

				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}
	public ArrayList<VeXe> VeXedistinctTime()
	{// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT distinct GioDi FROM vexe,chuyendi,tuyendi where vexe.IdChuyen=chuyendi.id and tuyendi.Id=chuyendi.MaTuyen group by NgayDi,IdChuyen,GioDi;";
		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{

				LocalTime time= LocalTime.parse(rs.getString("GioDi"));
				VeXe vexe = new VeXe();

				vexe.setGioDi(time);
				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}

	public ArrayList<VeXe> VeXedistinctDi()	{// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT distinct DiaDiemDi FROM vexe,chuyendi,tuyendi where vexe.IdChuyen=chuyendi.id and tuyendi.Id=chuyendi.MaTuyen group by NgayDi,IdChuyen,GioDi;";
		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{	

				VeXe vexe = new VeXe();
				vexe.setDiaDiemDi(rs.getString("DiaDiemDi"));
				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}
	public ArrayList<VeXe> VeXedistinctDen(){// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT distinct DiaDiemDen FROM vexe,chuyendi,tuyendi where vexe.IdChuyen=chuyendi.id and tuyendi.Id=chuyendi.MaTuyen group by NgayDi,IdChuyen,GioDi;";
		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{	

				VeXe vexe = new VeXe();
				vexe.setDiaDiemDen(rs.getString("DiaDiemDen"));
				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}
	public ArrayList<VeXe> VeXedistinctDonGia()
	{// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT distinct DonGia FROM vexe,chuyendi,tuyendi where vexe.IdChuyen=chuyendi.id and tuyendi.Id=chuyendi.MaTuyen group by NgayDi,IdChuyen,GioDi;";
		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{	

				VeXe vexe = new VeXe();
				vexe.setDonGia(rs.getBigDecimal("DonGia"));
				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}
	public ArrayList<VeXe> VeXedistinctSoLuong()
	{// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT distinct count(IdChuyen) as soluong  FROM vexe,chuyendi,tuyendi where vexe.IdChuyen=chuyendi.id and tuyendi.Id=chuyendi.MaTuyen group by NgayDi,IdChuyen,GioDi;";
		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{	

				VeXe vexe = new VeXe();
				vexe.setSoLuong(rs.getInt("soluong"));
				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}
	public ArrayList<VeXe> VeXedistinctHangDoi()
	{// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT distinct HangDoi FROM vexe,chuyendi,tuyendi where vexe.IdChuyen=chuyendi.id and tuyendi.Id=chuyendi.MaTuyen group by NgayDi,IdChuyen,GioDi;";
		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{	

				VeXe vexe = new VeXe();
				vexe.setHangDoi(rs.getString("HangDoi"));
				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}
	//end filter distinct


	//quyen xem ve cua nhan vien
	public ArrayList<VeXe> getAllVeXe(String IdChuyen,String Ngay){// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT  khachhang.CMND,IdChuyen,NgayDi,status,GioDi,DonGia,DiaDiemDi,DiaDiemDen,HangDoi,HoTen,SDT, count(IdChuyen) as soluong  FROM vexe,chuyendi,tuyendi,khachhang where vexe.CMND=khachhang.CMND and vexe.IdChuyen=chuyendi.id and tuyendi.Id=chuyendi.MaTuyen  and NgayDi=? and IdChuyen=?  group by NgayDi,IdChuyen,GioDi,SDT,status";
		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, Ngay);
			ps.setString(2, IdChuyen);
			ResultSet rs = ps.executeQuery();	
			while(rs.next())
			{
				LocalDate date1= LocalDate.parse(rs.getString("NgayDi"));
				LocalTime time= LocalTime.parse(rs.getString("GioDi"));
				//			
				VeXe vexe = new VeXe();
				vexe.setGioDi(time);
				vexe.setNgayDi(date1);
				vexe.setcMND(rs.getString("CMND"));
				vexe.setDiaDiemDen(rs.getString("DiaDiemDen"));
				vexe.setiDChuyen(rs.getInt("iDChuyen"));
				vexe.setDiaDiemDi(rs.getString("DiaDiemDi"));
				vexe.setDonGia(rs.getBigDecimal("DonGia"));
				vexe.setHangDoi(rs.getString("HangDoi"));

				vexe.setStatus(rs.getBoolean("status"));
				vexe.setHoTen(rs.getString("HoTen"));
				vexe.setsDT(rs.getString("SDT"));
				vexe.setSoLuong(rs.getInt("soluong"));

				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}
	public ArrayList<VeXe> getKhachGhe(String CMND,String IdChuyen,String Ngay){// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT MaGhe,NgayGioDat,status FROM vexe where CMND=? and IdChuyen=? and NgayDi=?";
		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, CMND);
			ps.setString(2, IdChuyen);
			ps.setString(3,Ngay);
			ResultSet rs = ps.executeQuery();	
			while(rs.next())
			{
				//				LocalDateTime date1= LocalDate.parse(rs.getString("NgayDi"));

				VeXe vexe = new VeXe();
				vexe.setMaGhe(rs.getString("MaGhe"));
				vexe.setStatus(rs.getBoolean("status"));
				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}

	public int UpdateStatus(String CMND,String IdChuyen,String Ngay,String MaGhe){
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "update vexe set status=1 where CMND=? and IdChuyen=? and NgayDi=? and MaGhe=?";
		int  rs=0;
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, CMND);
			ps.setString(2, IdChuyen);
			ps.setString(3,Ngay);
			ps.setString(4,MaGhe);
			rs = ps.executeUpdate();	
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return rs;
	}
	public int DeleteVe(String CMND,String IdChuyen,String Ngay,String MaGhe){
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "Delete From vexe where CMND=? and IdChuyen=? and NgayDi=? and MaGhe=?";
		int  rs=0;
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, CMND);
			ps.setString(2, IdChuyen);
			ps.setString(3,Ngay);
			ps.setString(4,MaGhe);
			rs = ps.executeUpdate();	
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return rs;
	}
	@Override
	public boolean Booking_Ve(VeXe veXe) {
		// TODO Auto-generated method stub
		try {
			Connection conn = ConnectionUtils.getConnection();
			String sql = "Insert into vexe(CMND,IdChuyen,NgayDi,MaGhe,NgayGioDat,status) values(?, ?, ?, ?, ?, 0)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, veXe.getcMND());
			ps.setInt(2, veXe.getiDChuyen());
			LocalDate ngaydi = veXe.getNgayDi();
			ps.setDate(3, java.sql.Date.valueOf(ngaydi));
			ps.setString(4, veXe.getMaGhe());	
		/*	ps.setString(5, veXe.getHangDoi());	*/
			LocalDateTime now = LocalDateTime.now();
			java.sql.Timestamp datetime_now = java.sql.Timestamp.valueOf(now);
			ps.setTimestamp(5,datetime_now);	
			System.out.println(datetime_now);
//			System.out.println("insert ve xe: " + ps.executeUpdate());
			int res = ps.executeUpdate();
			if(res > 0) 
			return true;
		}
		catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return false;
	}

	@Override
	public Integer CountGheKhach(String CMND, LocalDate ngayDi, Integer idChuyen) {
		// TODO Auto-generated method stub
		Integer CountGhe = 0;
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT distinct count(MaGhe) as soluongghe  FROM vexe where CMND = ? and NgayDi = ? and IdChuyen = ? ";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, CMND);
			ps.setDate(2, Date.valueOf(ngayDi));
			ps.setInt(3, idChuyen);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				CountGhe = rs.getInt("soluongghe");
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return CountGhe;
	}


	@Override
	public Boolean deleteTickeNotPay(VeXe veXe) {
		// TODO Auto-generated method stub
		Connection conn;
		try {
			conn = ConnectionUtils.getConnection();
			String sql = "delete from Vexe where CMND=? and IdChuyen=? and NgayDi=? and MaGhe=? and status=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, veXe.getcMND());
			pstm.setInt(2, veXe.getiDChuyen());
			pstm.setDate(3, java.sql.Date.valueOf(veXe.getNgayDi()));
			pstm.setString(4,veXe.getMaGhe());
			pstm.setBoolean(5,veXe.getStatus());
			int res = pstm.executeUpdate();
			if(res!=0)
				return true;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
