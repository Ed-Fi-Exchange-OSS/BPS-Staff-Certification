--SELECT @ApplicationId
DECLARE @ApplicationId INT
SELECT @ApplicationId = ApplicationId FROM [dbo].[Applications] WHERE ApplicationName = 'Ed-Fi ODS API';

-- Getting the Claim Ids that we will use.  
DECLARE @RelationshipBasedDataClaimId INT
SELECT @RelationshipBasedDataClaimId = ResourceClaimId FROM [dbo].[ResourceClaims] WHERE ResourceName = 'relationshipBasedData';

DECLARE @PrimaryRelationshipsClaimId INT
SELECT @PrimaryRelationshipsClaimId = ResourceClaimId FROM [dbo].[ResourceClaims] WHERE ResourceName = 'primaryRelationships';

DECLARE @ManagedDescriptorsResourceClaimId INT
SELECT @ManagedDescriptorsResourceClaimId = ResourceClaimId FROM [dbo].[ResourceClaims] WHERE ResourceName = 'managedDescriptors';

-- *** Staff License Claims ***
INSERT INTO [dbo].[ResourceClaims] ([DisplayName], [ResourceName] 
								   ,[ClaimName] 
								   ,[ParentResourceClaimId], [Application_ApplicationId])
VALUES ('staffLicense', 'staffLicense'
        ,'http://ed-fi.org/ods/identity/claims/my-bps/staffLicense'
        ,@RelationshipBasedDataClaimId, @ApplicationId);


-- *** MyBPS Extension Descriptor Claims ***
INSERT INTO [dbo].[ResourceClaims] ([DisplayName], [ResourceName] 
								   ,[ClaimName] 
								   ,[ParentResourceClaimId], [Application_ApplicationId])
VALUES ('licenseStageDescriptor', 'licenseStageDescriptor'
        ,'http://ed-fi.org/ods/identity/claims/my-bps/licenseStageDescriptor'
        ,@ManagedDescriptorsResourceClaimId, @ApplicationId);
		