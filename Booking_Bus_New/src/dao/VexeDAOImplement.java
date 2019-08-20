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
	public ArrayList<VeXe> getAllVe(){
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT vexe.IdChuyen,SDT,NgayDi,GioDi,GioDen,DiaDiemDi,DiaDiemDen,MaGhe,khachhang.CMND,HoTen FROM vexe,khachhang,chuyendi,tuyendi where khachhang.CMND=vexe.CMND and chuyendi.id=vexe.IdChuyen and chuyendi.MaTuyen=tuyendi.Id;";
		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
		
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				VeXe vexe = new VeXe();
				LocalDate date= LocalDate.parse(rs.getString("NgayDi"));
				LocalTime time= LocalTime.parse(rs.getString("GioDi"));
				LocalTime time2= LocalTime.parse(rs.getString("GioDen"));
				vexe.setGioDi(time);
				vexe.setGioDen(time2);
				vexe.setNgayDi(date);
				vexe.setDiaDiemDen(rs.getString("DiaDiemDen"));
				vexe.setsDT(rs.getString("SDT"));
				vexe.setDiaDiemDi(rs.getString("DiaDiemDi"));
				vexe.setiDChuyen(rs.getInt("IdChuyen"));
				vexe.setMaGhe(rs.getString("MaGhe"));
		
				vexe.setcMND(rs.getString("CMND"));
				vexe.setHoTen(rs.getString("HoTen"));
		
		
				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}
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
				String NgayGioDat = rs.getString("NgayGioDat");
				TuyenDi tuyenDi = new TuyenDi(maTuyen,diaDiemDi,diaDiemDen,hangDoi);
				ChuyenDi chuyenDi = new ChuyenDi(iDChuyen,GioDi,GioDen,donGia,tuyenDi);
				VeXe veXe = new VeXe(cMND,ngayDi,maGhe,donGia,status,chuyenDi,NgayGioDat);
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
//				 LocalDateTime ngayGioDi_dat = LocalDateTime.parse((rs.getTimestamp("NgayGioDat")).toString(), inputFormatter);
//				System.out.println(ngayGioDi_dat);
				String NgayGioDat = rs.getString("NgayGioDat");
			
				String maGhe = rs.getString("MaGhe");
				BigDecimal donGia = rs.getBigDecimal("DonGia");
				Boolean status = rs.getBoolean("Status");
				TuyenDi tuyenDi = new TuyenDi(maTuyen,diaDiemDi,diaDiemDen,hangDoi);
				ChuyenDi chuyenDi = new ChuyenDi(iDChuyen,GioDi,GioDen,donGia,tuyenDi);
				VeXe veXe = new VeXe(cMND,ngayDi,maGhe,donGia,status,chuyenDi,NgayGioDat);
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
		String sql = "SELECT IdChuyen,HangDoi,NgayDi,GioDi,DiaDiemDen,DiaDiemDi,vexe.DonGia,count(IdChuyen) as soluong,sum(status) as statuscount FROM vexe,chuyendi,tuyendi where vexe.IdChuyen=chuyendi.id and tuyendi.Id=chuyendi.MaTuyen";	
		String data[] = {"IdChuyen", "NgayDi", "GioDi","DiaDiemDi","DiaDiemDen","DonGia","HangDoi"};
		for(int i=0;i<data.length;i++)
		{
			if(count.equals(data[i]))
			{
				sql=sql+" and "+data[i]+"='"+value+"'";
			}
		}
		for(int i=0;i<data.length;i++)
		{
			if(count2.equals(data[i]))
			{
				sql=sql+" and "+data[i]+"='"+value2+"'";
			}
		}

		sql=sql+" group by NgayDi,IdChuyen,GioDi;";
		System.out.println(sql);
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
				vexe.setStatuscount(rs.getInt("statuscount"));
				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}

	
	public ArrayList<VeXe> filterDistinct(String value,String count)
	{// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql="";
		String data[] = {"IdChuyen", "NgayDi", "GioDi","DiaDiemDi","DiaDiemDen","DonGia","HangDoi"};
		
		for(int i=0;i<data.length;i++)
		{
			if(count.equals(data[i]))
			{  	
				sql+="SELECT DISTINCT "+data[i]+" FROM vexe,chuyendi,tuyendi where vexe.IdChuyen=chuyendi.id and tuyendi.Id=chuyendi.MaTuyen  group by NgayDi,IdChuyen,GioDi";
			break;
			}
		}	

		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while(rs.next())
			{
				VeXe vexe = new VeXe();

				if(count.equals(data[0]))
				{
					vexe.setiDChuyen(rs.getInt("IdChuyen"));
				}
				if(count.equals(data[1]))
				{
					LocalDate date= LocalDate.parse(rs.getString("NgayDi"));
					vexe.setNgayDi(date);
				}
				if(count.equals(data[2]))
				{
					LocalTime time= LocalTime.parse(rs.getString("GioDi"));
					vexe.setGioDi(time);
				}
				if(count.equals(data[3]))
				{
					vexe.setDiaDiemDi(rs.getString("DiaDiemDi"));
				}
				if(count.equals(data[4]))
				{
					vexe.setDiaDiemDen(rs.getString("DiaDiemDen"));
				}
				if(count.equals(data[5]))
				{
					vexe.setDonGia(rs.getBigDecimal("DonGia"));
				}
				if(count.equals(data[6]))
				{
					vexe.setHangDoi(rs.getString("HangDoi"));
				}
				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}

	public ArrayList<VeXe> filterDistinct2(String value,String count,String value2,String count2)
	{// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String sql="";
		String data[] = {"IdChuyen", "NgayDi", "GioDi","DiaDiemDi","DiaDiemDen","DonGia","HangDoi"};
		String sql_temp="";
	
		for(int i=0;i<data.length;i++)
		{
			if(count.equals(data[i]))
			{  	
				sql+=" FROM vexe,chuyendi,tuyendi where vexe.IdChuyen=chuyendi.id and tuyendi.Id=chuyendi.MaTuyen ";
				sql_temp=" and "+data[i]+"='"+value+"'";
			}
		}
		for(int i=0;i<data.length;i++)
		{
			if(count2.equals(data[i]))
			{
				sql=sql+sql_temp;
				
			}
		}
		sql=sql+" group by NgayDi,IdChuyen,GioDi";

			for(int i=0;i<data.length;i++)
			{
				if(count2.equals(data[i]))
				{
					String sql1 = "SELECT DISTINCT "+data[i];
					sql=sql1+sql;
				}
			}

	
		ArrayList<VeXe> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
	
			while(rs.next())
			{
				VeXe vexe = new VeXe();

				if(count2.equals(data[0]))
				{
					vexe.setiDChuyen(rs.getInt("IdChuyen"));
				}
				if(count2.equals(data[1]))
				{
					LocalDate date= LocalDate.parse(rs.getString("NgayDi"));
					vexe.setNgayDi(date);
				}
				if(count2.equals(data[2]))
				{
					LocalTime time= LocalTime.parse(rs.getString("GioDi"));
					vexe.setGioDi(time);
				}
				if(count2.equals(data[3]))
				{
					vexe.setDiaDiemDi(rs.getString("DiaDiemDi"));
				}
				if(count2.equals(data[4]))
				{
					vexe.setDiaDiemDen(rs.getString("DiaDiemDen"));
				}
				if(count2.equals(data[5]))
				{
					vexe.setDonGia(rs.getBigDecimal("DonGia"));
				}
				if(count2.equals(data[6]))
				{
					vexe.setHangDoi(rs.getString("HangDoi"));
				}
				arr.add(vexe);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}

	@Override
	public ArrayList<VeXe> getAllVeXe()
	{
		ArrayList<VeXe> array =  new ArrayList<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			String query="SELECT * FROM vexe INNER JOIN chuyendi ON vexe.IdChuyen=chuyendi.id "
					+ "INNER JOIN tuyendi ON chuyendi.MaTuyen=tuyendi.Id";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				int iDChuyen = rs.getInt("IdChuyen");
				String cMND = rs.getString("CMND");
				String diaDiemDi = rs.getString("DiaDiemDi");
				String diaDiemDen = rs.getString("DiaDiemDen");
				String hangDoi = rs.getString("HangDoi");
				String maTuyen = rs.getString("MaTuyen");
				LocalTime GioDi = LocalTime.parse(rs.getString("GioDi"));
				LocalTime GioDen = LocalTime.parse(rs.getString("GioDen"));
				LocalDate ngayDi = LocalDate.parse(rs.getString("NgayDi"));
//				 DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//				 LocalDateTime ngayGioDi_dat = LocalDateTime.parse((rs.getTimestamp("NgayGioDat")).toString(), inputFormatter);
//				System.out.println(ngayGioDi_dat);
				String NgayGioDat = rs.getString("NgayGioDat");
				String maGhe = rs.getString("MaGhe");
				BigDecimal donGia = rs.getBigDecimal("DonGia");
				Boolean status = rs.getBoolean("Status");
				TuyenDi tuyenDi = new TuyenDi(maTuyen,diaDiemDi,diaDiemDen,hangDoi);
				ChuyenDi chuyenDi = new ChuyenDi(iDChuyen,GioDi,GioDen,donGia,tuyenDi);
				VeXe veXe = new VeXe(cMND,ngayDi,maGhe,donGia,status,chuyenDi,NgayGioDat);
				array.add(veXe);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;
	}
	//quyen xem ve cua nhan vien
	public ArrayList<VeXe> getAllVeXe(String IdChuyen,String Ngay){// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT  khachhang.CMND,IdChuyen,NgayDi,status,GioDi,vexe.DonGia,DiaDiemDi,DiaDiemDen,HangDoi,HoTen,SDT, count(IdChuyen) as soluong  FROM vexe,chuyendi,tuyendi,khachhang where vexe.CMND=khachhang.CMND and vexe.IdChuyen=chuyendi.id and tuyendi.Id=chuyendi.MaTuyen  and NgayDi=? and IdChuyen=?  group by NgayDi,IdChuyen,GioDi,SDT,status";
		System.out.println(sql);
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
				vexe.setNgayGioDat(rs.getString("NgayGioDat"));
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
			String sql = "Insert into vexe(CMND,IdChuyen,NgayDi,MaGhe,NgayGioDat,DonGia,status) values(?, ?, ?, ?, ?, ?, 0)";
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
			ps.setBigDecimal(6,veXe.getDonGia());
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
