				<tr>
					<td>
						<te:field  name="title"/>
						<te:field  name="subtitle"/>
						<te:field  name="substring(html(intro),150,...)"/>
					</td>
					<td>
					<%-- mmevent .. needs more work (maybe a function for this?) --%>
					<%-- the current episode is selected because it's the episode with the mmevents that is the closest to the current time --%>
					<mm:related path="bcastrel,mmevents" fields="bcastrel.number,bcastrel.rerun" constraints="bcastrel.rerun != 0" >
						<mm:node element="mmevents">
							<mm:field name="weekday_start"/>
							<mm:field name="day_start"/>
							<mm:field name="longmonth_start"/>
							<mm:field name="year_start"/>
							<mm:field name="time_start"/>
						</mm:node>

						<%-- get the medium of the maps (program), bcastrel only contains a number (1,2,3 if 4) showing the channel --%>
						<%-- the medium is stored in the maps object so first select the maps object , then display the channel --%>
						<mm:node referid="mapsid">
							<mm:field name="medium" id="medium" write="false">
								<mm:compare referid="medium" value="1"><%-- TV? --%>
									Nederland 
								</mm:compare>
								<mm:compare referid="medium" value="2"><%-- RADIO --%>
									Radio
								</mm:compare>
							</mm:field>
						</mm:node>
						<mm:node element="bcastrel">
							<mm:field name="channel"/>
						</mm:node>

					</mm:related>
					<mm:relatednodes type="images" max="1">
							<img src="<mm:image template="s(100x100)"/>" />
					</mm:relatednodes>

					<% boolean hasAudio = false; %>
					<% boolean hasVideo = false; %>
					<mm:relatednodes type="mediafragments" jspvar="node">
						<mm:first>Bevat</mm:first>
					</mm:relatednodes>
					<mm:relatednodes type="audiofragments" jspvar="node">
						<mm:first><%  hasAudio = true ;%></mm:first>
					</mm:relatednodes>
					<mm:relatednodes type="videofragments" jspvar="node">
						<mm:first><%  hasVideo = true ;%></mm:first>
					</mm:relatednodes>
                                        
					<% if (hasAudio ) { %> audio <%}%>
					<% if (hasAudio && hasVideo) { %> en <%}%>
					<% if (hasVideo) { %> video <%}%>
					<a href="<te:url/>">[Meer icoon]</a>
					
					</td>
				</tr>
