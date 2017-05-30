package com.RM.Model;

public class Food
{
	private String m_foodID;
	private String m_foodName;
	private float m_foodPrice;
	private String m_foodImgPath;
	private String m_restNumber;
	
	public String getFoodID()
	{
		return m_foodID;
	}
	public void setFoodID(String foodID)
	{
		this.m_foodID = foodID;
	}
	public String getFoodName()
	{
		return m_foodName;
	}
	public void setFoodName(String foodName)
	{
		this.m_foodName = foodName;
	}
	public float getFoodPrice()
	{
		return m_foodPrice;
	}
	public void setFoodPrice(float foodPrice)
	{
		this.m_foodPrice = foodPrice;
	}
	public String getFoodImgPath()
	{
		return m_foodImgPath;
	}
	public void setFoodImgPath(String foodImgPath)
	{
		this.m_foodImgPath = foodImgPath;
	}
	public String getRestNumber()
	{
		return m_restNumber;
	}
	public void setRestNumber(String restNumber)
	{
		this.m_restNumber = restNumber;
	}
}
