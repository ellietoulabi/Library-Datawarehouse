CREATE OR ALTER PROCEDURE DW_Fact_Acc_Research_Second_SP 
AS
	TRUNCATE TABLE CulturalDataMart.accFactOverResearch
	INSERT INTO CulturalDataMart.accFactOverResearch (ResearchID,
														BranchID,			
														ResearchCategoryID,
														overallCostPaid,
														remainedBudget,
														estimatedBudget)
	SELECT distinct P.ResearchID,
		P.BranchID,
		P.ResearchCategoryID,
		SUM(totalCostPaid) OVER (PARTITION BY (ResearchID)) overallCostPaid,
		D.cost-SUM(totalCostPaid) OVER (PARTITION BY (ResearchID)) remainedBudget,
		D.Cost AS estimatedBudget
	FROM CulturalDataMart.snapshotFactOverResearch AS P INNER JOIN dimResearch AS D ON P.ResearchID=D.ID

--exec DW_Fact_Acc_Research_Second_SP 