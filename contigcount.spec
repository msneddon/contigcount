/*
A KBase module: contigcount

This sample module contains one small method - count_contigs.
*/

module contigcount {

	/*
	A string representing a ContigSet id.
	*/
	typedef string contigset_id;
	
	/*
	Count contigs in a ContigSet
	
	contigset_id - the ContigSet to count.
	*/
	funcdef count_contigs(contigset_id) returns (UnspecifiedObject) authentication required;

};