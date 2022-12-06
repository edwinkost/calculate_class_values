
pcrcalc xcoordinate.map 
pcrcalc ycoordinate.map

# get the representative pixel for every crop class
pcrcalc areaminimum_xcoordinate.map                                      = "areaminimum(xcoordinate.map , nominal_2021_30m_cdls.map)" 
pcrcalc nominal_2021_30m_cdls_representative.map                         = "if(xcoordinate.map eq areaminimum_xcoordinate.map, nominal_2021_30m_cdls.map)"
pcrcalc areaminimum_ycoordinate_nominal_2021_30m_cdls_representative.map = "areaminimum(ycoordinate.map , nominal_2021_30m_cdls_representative.map)"
pcrcalc nominal_2021_30m_cdls_representative.map                         = "if(ycoordinate.map eq areaminimum_ycoordinate_nominal_2021_30m_cdls_representative.map, nominal_2021_30m_cdls_representative.map)"


#~ # the input files are stored on the following location (please make your own backup)
#~ (pcrglobwb_python3_2022-10-19) sutan101@velocity.geo.uu.nl:/scratch/sutan101/tmp/sioux/final/finalize$ ls -lah *
#~ nominal_2021_30m_cdls.map
#~ nominal_2021_30m_cdls_representative.map
#~ nominal_2021_30m_cdls_representative.txt
#~ nominal_tl_2021_us_state_30m.map


# get the area (m2) for every crop in the state 1 - NOTE: We have to loop this for every state!!

# - calculate the area (for the state 1)
pcrcalc areatotal_m2_nom_2021_30m_cdls_state_1.map = "if(defined(nominal_2021_30m_cdls_representative.map), areatotal(if(nominal_tl_2021_us_state_30m.map eq 1, scalar(30.0*30.0), scalar(0.0)), nominal_2021_30m_cdls.map))"                                                        
# - convert the map to become a column file (for the state 1)
map2col nominal_2021_30m_cdls_representative.map areatotal_m2_nom_2021_30m_cdls_state_1.map crop_area_m2_for_state_1.txt

# Note: If your calculation is done, please remove the files areatotal_*. as they are huge.


#~ # - for checking only
#~ pcrcalc areatotal_m2_nom_2021_30m_cdls_state_1_check.map = "(areatotal(if(nominal_tl_2021_us_state_30m.map eq 1, scalar(30.0*30.0), scalar(0.0)), nominal_2021_30m_cdls.map))"
