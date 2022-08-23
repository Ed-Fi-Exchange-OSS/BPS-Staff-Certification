
-- Descriptors for: Staff License Status
IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE [Namespace]='uri://mybps.org/LicenseStatusDescriptor')
BEGIN
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStatusDescriptor','Approved','Approved','Approved');
	Insert into edfi.LicenseStatusDescriptor (LicenseStatusDescriptorId) VALUES (@@IDENTITY);
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStatusDescriptor','Inactive/Invalid','Inactive/Invalid','Inactive/Invalid');
	Insert into edfi.LicenseStatusDescriptor (LicenseStatusDescriptorId) VALUES (@@IDENTITY);
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStatusDescriptor','Inactive/Invalid: RETELL/SEI R','Inactive/Invalid: RETELL/SEI R','Inactive/Invalid: RETELL/SEI R');
	Insert into edfi.LicenseStatusDescriptor (LicenseStatusDescriptorId) VALUES (@@IDENTITY);
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStatusDescriptor','Invalid','Invalid','Invalid');
	Insert into edfi.LicenseStatusDescriptor (LicenseStatusDescriptorId) VALUES (@@IDENTITY);
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStatusDescriptor','Invalid: RETELL/SEI R','Invalid: RETELL/SEI R','Invalid: RETELL/SEI R');
	Insert into edfi.LicenseStatusDescriptor (LicenseStatusDescriptorId) VALUES (@@IDENTITY);
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStatusDescriptor','Licensed','Licensed','Licensed');
	Insert into edfi.LicenseStatusDescriptor (LicenseStatusDescriptorId) VALUES (@@IDENTITY);
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStatusDescriptor','Licensed: RETELL/SEI R','Licensed: RETELL/SEI R','Licensed: RETELL/SEI R');
	Insert into edfi.LicenseStatusDescriptor (LicenseStatusDescriptorId) VALUES (@@IDENTITY);
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStatusDescriptor','Surrendered','Surrendered','Surrendered');
	Insert into edfi.LicenseStatusDescriptor (LicenseStatusDescriptorId) VALUES (@@IDENTITY);
END;

-- Descriptors for: Staff License Stage
IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE [Namespace]='uri://mybps.org/LicenseStageDescriptor')
BEGIN
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStageDescriptor','Emergency','Emergency','Emergency');
	Insert into mybps.LicenseStageDescriptor (LicenseStageDescriptorId) VALUES (@@IDENTITY);
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStageDescriptor','Endorsement','Endorsement','Endorsement');
	Insert into mybps.LicenseStageDescriptor (LicenseStageDescriptorId) VALUES (@@IDENTITY);
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStageDescriptor','Full','Full','Full');
	Insert into mybps.LicenseStageDescriptor (LicenseStageDescriptorId) VALUES (@@IDENTITY);
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStageDescriptor','Initial','Initial','Initial');
	Insert into mybps.LicenseStageDescriptor (LicenseStageDescriptorId) VALUES (@@IDENTITY);
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStageDescriptor','Initial Extension','Initial Extension','Initial Extension');
	Insert into mybps.LicenseStageDescriptor (LicenseStageDescriptorId) VALUES (@@IDENTITY);
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStageDescriptor','Preliminary','Preliminary','Preliminary');
	Insert into mybps.LicenseStageDescriptor (LicenseStageDescriptorId) VALUES (@@IDENTITY);
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStageDescriptor','Professional','Professional','Professional');
	Insert into mybps.LicenseStageDescriptor (LicenseStageDescriptorId) VALUES (@@IDENTITY);
	INSERT INTO edfi.Descriptor (Namespace,CodeValue,ShortDescription,Description) VALUES ('uri://mybps.org/LicenseStageDescriptor','Temporary','Temporary','Temporary');
	Insert into mybps.LicenseStageDescriptor (LicenseStageDescriptorId) VALUES (@@IDENTITY);
END;
