# GENESIS: Statistical methods for analyzing genetic data from samples
Maintainer: (?)
Version: (x.x)

## Description:
Runs single variant and aggregate test for genetic data. Implements Single-variant, Burden, SKAT and SKAT-O tests for Continuous or Dichotomous outcomes. All tests account for familial relatedness through kinship matrices. Underlying functions adapted from: Conomos MP and Thornton T (2016). GENESIS: GENetic EStimation and Inference in Structured samples (GENESIS): Statistical methods for analyzing genetic data from samples with population structure and/or relatedness. R package version 2.5+. http://bioconductor.org/packages/devel/bioc/html/GENESIS.html https://github.com/smgogarten/GENESIS

### What do these apps do?
Runs phenotype-genotype association analyses on sequence data.  The first App genesis_nullmodel will run the null model.  This is fitting your model with your outcome, adjustments and kinship matrix, but does not use the genotypes.  The second App genesis_tests takes the null model object from the first step and runs your association analysis.  The same null model can be used for single-variant or aggregate tests.

### What are typical use cases for this app?
This app can sun single-variant, SKAT and burden tests. It will account for relatedness using a kinship matrix and implements GMMAT for logistic regression.

### What data are required for this app to run?
This app requires a genotype file in GDS format (\*.gds), a kinship matrix and a phenotype file. Rare variant tests require a gene-aggregation file and an annotation file.

### What does this app output?
The first genesis_null model will output a copy of your null model as an R object.  The results of the genesis_tests App will be a CSV file of association results

### How does this app work?
This App uses the GENESIS package developed by Matt Conomos, Tim Thornton and Stephanie Gogarten (TOPmed DCC). This App has been optimized to allow genotype random access from the GDS genotype format files and to parallelize over a number of cores.

## Inputs

### genesis_nullmodel

phenofile: [file] **Phenotypes** for each sample in delimited text file
pheno_id: [string] **Sample ID** Column name that contains the sample IDs. These IDs should match the genotype file IDs and the kinship file IDs.
genotypefile: [file] **Genotypes** Any chromosome of the dataset you are using. This is used to subset your phenotype to only the samples in the GDS data set. This is a GDS formatted genotype file ( see convertVCF2GDS_v3 App ). 
kinshipmatrix: [file] **Kinship/GRM** Kinship matrix with sample ids as the row and column names. Matrices save as R data will load faster, but csv is accepted as well. Matrix can contain pedigree or empirical kinship values
outcome_name: [string] **Column name of outcome variable**
covariate_list: [string] **Covariates** Comma separated list that match column names in the phenotype file. Leave blank for no adjustments
outcome_type: [string] **Continuous or Dichotomous**
test_stat: [string] Valid tests statistic types are: **Score, Wald**. Firth can be used with Burden test only.
outputfilename: [string] **Output Name** prefix for output file name, no spaces.
het_vars: [string] **Heterogenous Variances** Fits model allowing for heterogeneous variances by group. Provide column name in phenotype file that defines the group.
conditional: [string] chr:pos:ref:alt format for the SNP that will be added to the model. Multiple snps in a comma delimited list can be added. (e.g. '22:16425814:C:T' or '22:16425814:C:T,22:17808063:TA:T,22:18096610:G:T')
disk: [int] disk space in GB
memory: [int] memory in GB

## genesis_btest

null_model: [file] **Null model** object that is the output of genesis_nullmodel.  The same null model can be used for single variant and aggregate tests.
genotypefile: [file] **Genotypes** A GDS formatted genotype file ( see convertVCF2GDS_v3 App ).   This is used to confirm which samples are in your data set or for providing the data for a conditional analysis only.  If not running a conditional analysis, I suggest using chr22 for this purpose. 
snpinfofile: [file] **Annotation** Tab delimited annotation file for filtering variants. The file should be tab separated and contain the columns 'SNP' ( format 19:12345), 'CHR' (numeric 1-24) and 'POS'. Other column names can be used for filtering using snp_filter input.
varaggfile: [file] **Variant aggregation file** CSV file listing whichdn variants should be grouped together for aggregate tests (e.g. SKAT). The file contains 'group_id' ( window, gene etc.), 'chr' ('1' or 'chr1'), 'pos', 'ref' and 'alt'.
test_type: [string] **Test type** Valid tests are one of the collapsing tests SKAT, Burden or Single
outputfilename: [string] **Output Name** prefix for output file name, no spaces
min_mac: [int] **Minimim MAC** Minimum minor allele count for threshold ( only used for single variant tests )
weights: **Weights function** Beta weights set to flat weights (e.g. set to 'c(1,1)' for unweighted, 'c(1,25)' for Wu weights or 'c(0.5,0.5)' for Madsen-Browning weights). Not used in single var analyses.
top_maf: [float] **Max MAF** Maximim minor allele frequency ( generally used for aggregate tests )
user_cores: [int] defaults to 2 less than the number of cores available. memory needed will depend on test configuation and sample size. if your analysis is terminiating with an out-of-memory error, reduce the number of cores



