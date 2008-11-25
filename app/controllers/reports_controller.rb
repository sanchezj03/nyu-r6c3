class ReportsController < ApplicationController
  before_filter :login_required
  
  # Returns child in XML format
  def table_for_spss
    total_columns = 0
    top_columns_row = 0
	
	table = []
    children = Child.find(:all, :limit => 5)
   
    for child in children
      row = {}
     
      # Put all the data of the child in the table
      for col in Child.column_names
	    total_columns += 1
        row[col.to_sym] = child.send(col)
      end
     
      # Put the most recent eligibility entry into the table
      elig = child.eligibilities.first
      if elig
        row[:eligibilities_reason_id] = elig.reason_id
        row[:eligibilities_eligible] = elig.eligible
        row[:eligibilities_comments] = elig.comments
		total_columns += 3
      end
	
		for i in 1..3
			caregiver = child.caregivers[ i - 1 ]
			if caregiver
				row["caregivers_#{i}_relation"] = caregiver.relation
				row["caregivers_#{i}_first_name"] = caregiver.first_name
				row["caregivers_#{i}_last_name"] = caregiver.last_name
				row["caregivers_#{i}_caregiver_relation_id"] = caregiver.caregiver_relation_id
				row["caregivers_#{i}_comments"] = caregiver.comments
				total_columns += 5
			end
		end
		
		if row.keys.size > top_columns_row
			if !table.empty?
				table << table[0]
				table[0] = row
			end
			
			top_columns_row = row.keys.size
		end
     
      table << row
    end
	
    render :partial => 'table', :locals => { :table => table }
  end
  
  def vconsentphase1
    @records = Child.find_by_sql("SELECT * FROM vconsentphase1")
    render :action => 'view'
  end

  
  def vchildren
    @records = Child.find_by_sql("SELECT * FROM children")
    render :action => 'view'
  end

 def vconsentphase2
    @records = Child.find_by_sql("SELECT * FROM vconsentphase2")
    render :action => 'view'
  end

 def ListNames
    @records = Child.find_by_sql("SELECT child_id FROM children ")
    render :action => 'view'
end

  def r1
    @records = Child.find_by_sql("SELECT * FROM freport")
    render :action => 'view'
  end
  
   def child1
    @records = Child.find_by_sql("SELECT * FROM childncg")
    render :action => 'view'
  end
  
   
  def distributionSchools
    @records = Child.find_by_sql("SELECT * FROM r1b")
    @intervention= Child.find_by_sql("SELECT     
'I' AS Total,  
SUM(EligibleAtRecruitment) AS EligibleAtRecruitment, 
SUM(CG1ConsentPhase1) AS CG1ConsentPhase1, 
SUM(CG1ConsentPhase2) AS CG1ConsentPhase2, 
SUM(CG2ConsentPhase1) AS CG2ConsentPhase1, 
SUM(CG2ConsentPhase2) AS CG2ConsentPhase2,
sum(numChildren) AS numChildren
FROM         R1b
where SchoolId in (66,114,135,167,394)")
    
    @control=Child.find_by_sql("SELECT     
'C' AS Total,  
SUM(EligibleAtRecruitment) AS EligibleAtRecruitment, 
SUM(CG1ConsentPhase1) AS CG1ConsentPhase1, 
SUM(CG1ConsentPhase2) AS CG1ConsentPhase2, 
SUM(CG2ConsentPhase1) AS CG2ConsentPhase1, 
SUM(CG2ConsentPhase2) AS CG2ConsentPhase2,
sum(numChildren) AS numChildren
FROM         R1b
where SchoolId in (181,208,219,244,115)")
    
    @sums = Child.find_by_sql("SELECT     
'Tot' AS Total,
SUM(EligibleAtRecruitment) AS EligibleAtRecruitment, 
SUM(CG1ConsentPhase1) AS CG1ConsentPhase1, 
SUM(CG1ConsentPhase2) AS CG1ConsentPhase2, 
SUM(CG2ConsentPhase1) AS CG2ConsentPhase1, 
SUM(CG2ConsentPhase2) AS CG2ConsentPhase2,
sum(numChildren) AS numChildren
FROM         R1b")

end
   
end