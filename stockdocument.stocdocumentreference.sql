SELECT X.DocumentID,
       X.DocumentCode,
	   X.DocumentTypeID,
	   X.StatusID,
	   R.BookerStoreID,
	   R.BookerWorkstationID,
	   R.DocumentCode AS ReferDocumentCode,
	   R.DocumentID AS ReferDocumentID,
	   XR.ReferStoreID,
	   XR.ReferWorkstationID

FROM StockDocument X WITH(NOLOCK)
LEFT JOIN StockDocumentReference XR WITH(NOLOCK)
	ON X.DocumentID = XR.DocumentID

LEFT JOIN StockDocument R WITH(NOLOCK)
	ON XR.ReferStoreID = R.BookerStoreID

	AND 
	XR.ReferWorkstationID = R.BookerWorkstationID
	AND 
	XR.ReferDocumentID = R.DocumentID
