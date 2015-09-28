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
	A string representing a workspace name.
	*/
	typedef string workspace_name;
	
	/*
	Count contigs in a ContigSet
	
	contigset_id - the ContigSet to count.
	*/
	async funcdef count_contigs(workspace_name,contigset_id) returns (UnspecifiedObject) authentication required;
};
