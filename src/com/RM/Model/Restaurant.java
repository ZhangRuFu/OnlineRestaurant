package com.RM.Model;

public class Restaurant extends User
{
	private String m_position;
	private String m_name;
	private String m_introduction;
	private String m_imgPath;
	private float m_deliveryCost;

	public String getPosition()
	{
		return m_position;
	}

	public void setPosition(String position)
	{
		m_position = position;
	}

	public String getName()
	{
		return m_name;
	}

	public void setName(String name)
	{
		this.m_name = name;
	}

	public String getIntroduction()
	{
		return m_introduction;
	}

	public void setIntroduction(String introduction)
	{
		this.m_introduction = introduction;
	}

	public float getDeliveryCost()
	{
		return m_deliveryCost;
	}

	public void setDeliveryCost(float deliveryCost)
	{
		this.m_deliveryCost = deliveryCost;
	}

	public String getImgPath()
	{
		return m_imgPath;
	}

	public void setImgPath(String imgPath)
	{
		this.m_imgPath = imgPath;
	}
}
