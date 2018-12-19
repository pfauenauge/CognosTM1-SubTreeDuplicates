601,100
602,"SubtreeDuplicates_Find"
562,"NULL"
586,
585,
564,
565,"hr@EdbbOaXTWpOFEtReXAQV7X2^=<g^4b`yAfnkWKGcIX4Kx@\FNW<imBGjkc=lO1h85eXj6bu<d=rZ01_wS4GTOutD`LpX9?pr5u[lNjVEnRLe8@ceIv7RKE445iT@8;QEnGiLKd;tp:Q:lnBGU8II[hEHHWI<b[:kBzmJ<8kh`lCgix2?s1=AVqX?mxl[<kct_zOF2"
559,1
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,0
567,","
588,","
589,
568,""""
570,
571,
569,0
592,0
599,1000
560,7
DimensionName
ParentElement
DeleteDuplicates
TempSubset
TempSubsetDuplicates
TempSubsetDuplicatesKeep
TreeLevel
561,7
2
2
1
2
2
1
1
590,7
DimensionName,""
ParentElement,""
DeleteDuplicates,1
TempSubset,"zzSubtreeDuplicatesTemp"
TempSubsetDuplicates,"zzSubtreeDuplicatesFound"
TempSubsetDuplicatesKeep,1
TreeLevel,0
637,7
DimensionName,"Dimension name"
ParentElement,"Parent element where to search for duplicates"
DeleteDuplicates,"1 = Delete duplicates starting from 2nd occurence"
TempSubset,"Temporary Subset to find duplicates. Change only case of name collisions."
TempSubsetDuplicates,"Temporary Subset with all duplicates found"
TempSubsetDuplicatesKeep,"1 = Keep the temporary Subset of found duplicates"
TreeLevel,"Don't change this parameter. It is used for looping through the levels of the tree"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,68

#****Begin: Generated Statements***
#****End: Generated Statements****


IF( DimensionExists( DimensionName ) = 0 );
  # Dimension name doesn't exist
  ProcessError;
ENDIF;

IF( SubsetExists( DimensionName , TempSubset ) = 0 );
  SubsetCreate( DimensionName , TempSubset );
ELSEIF( TreeLevel = 0 );
  SubsetDeleteAllElements( DimensionName , TempSubset );
ENDIF;

IF( SubsetExists( DimensionName , TempSubsetDuplicates ) = 0 );
  SubsetCreate( DimensionName , TempSubsetDuplicates );
ELSEIF( TreeLevel = 0 );
  SubsetDeleteAllElements( DimensionName , TempSubsetDuplicates );
ENDIF;



# Loop through all child elements of ParentElement on the next level and
#  1)
InitialTreeLevel = TreeLevel;
TreeLevel = TreeLevel +1;
nComp = ElCompN( DimensionName, ParentElement );
iCount = 1;
While ( iCount <= nComp);
  sChild = ElComp( DimensionName,  ParentElement, iCount );


  isInSubset = 0;
  sz = SubsetGetSize( DimensionName , TempSubset);

  nCount = 1;
  WHILE( nCount  <= sz);
    ElName = SubsetGetElementName( DimensionName , TempSubset, nCount );
    IF( ElName @= sChild );
      isInSubset = 1;
      nCount = sz + 1;
    ENDIF;
    nCount  = nCount + 1;
  END;


  SubsetElementInsert( DimensionName , TempSubset , sChild , 1);
  IF( isInSubset > 0 );
    SubsetElementInsert( DimensionName , TempSubsetDuplicates , sChild , 1);
    IF( DeleteDuplicates = 1 );
      DimensionElementComponentDeleteDirect( DimensionName , ParentElement , sChild );
      iCount = iCount -1;
      nComp = nComp -1;
    ENDIF;
  ENDIF;

  IF( DTYPE( DimensionName,  sChild ) @= 'C' &  ( isInSubset = 0 % DeleteDuplicates = 0 ) );
    ExecuteProcess( GetProcessName() , 'DimensionName' , DimensionName , 'ParentElement', sChild , 
                                'DeleteDuplicates', DeleteDuplicates, 'TempSubset', TempSubset, 'TempSubsetDuplicates', TempSubsetDuplicates, 'TempSubsetDuplicatesKeep', TempSubsetDuplicatesKeep , 
                                'TreeLevel' , TreeLevel );
  ENDIF;
          
  iCount = iCount + 1 ;
End;


573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,12

#****Begin: Generated Statements***
#****End: Generated Statements****

IF( InitialTreeLevel = 0 );
  SubsetDestroy( DimensionName , TempSubset );

  IF( TempSubsetDuplicatesKeep <> 1 );
    SubsetDestroy( DimensionName , TempSubsetDuplicates );
  ENDIF;

ENDIF;
576,CubeAction=1511DataAction=1503CubeLogChanges=0
930,0
638,1
804,0
1217,0
900,
901,
902,
903,
906,
929,
907,
908,
904,0
905,0
909,0
911,
912,
913,
914,
915,
916,
917,0
918,1
919,0
920,50000
921,""
922,""
923,0
924,""
925,""
926,""
927,""
