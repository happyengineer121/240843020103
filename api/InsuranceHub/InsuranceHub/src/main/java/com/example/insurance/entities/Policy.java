package com.example.insurance.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name = "policy")
public class Policy {

	 @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int PolicyID;
	 

		private String P_name;
		
		public Policy(int policyID, String p_name, String premium, String terms, int i_ID) {
			super();
			PolicyID = policyID;
			P_name = p_name;
			Premium = premium;
			Terms = terms;
			I_ID = i_ID;
		}

		private String Premium;
		
		private  String Terms;
		
		private int I_ID;
		
		private String Benefits;
		
	
	public Policy() {
			super();
			// TODO Auto-generated constructor stub
		}

	public int getPolicyID() {
		return PolicyID;
	}

	public void setPolicyID(int policyID) {
		PolicyID = policyID;
	}

	public String getP_name() {
		return P_name;
	}

	public void setP_name(String p_name) {
		P_name = p_name;
	}

	public String getPremium() {
		return Premium;
	}

	public void setPremium(String premium) {
		Premium = premium;
	}

	public String getTerms() {
		return Terms;
	}

	public void setTerms(String terms) {
		Terms = terms;
	}

	public int getI_ID() {
		return I_ID;
	}

	public void setI_ID(int i_ID) {
		I_ID = i_ID;
	}

	public String getBenefits() {
		return Benefits;
	}

	public void setBenefits(String benefits) {
		Benefits = benefits;
	}
	
	
	
	
	
	
	
	
}
