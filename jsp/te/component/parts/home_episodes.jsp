				<tr>
					<td>
                                       <a href="<te:url/>">
						<te:field  name="title"/>
						<te:field  name="subtitle"/>
						<te:field  name="substring(html(intro),150,...)"/>
				               <img src="http://images.vpro.nl/img.db?pijl_zwart_wit_gif+dia+colorizehex(996600)+f(gif)" border="0"/>
                                        </a>
					</td>
					<td>
                                        <a href="<te:url/>">
					<%-- mmevent .. needs more work (maybe a function for this?) 
					   the current episode is selected because it's the episode with the mmevents that is the closest to the current time  --%>
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
							<img src="<mm:image template="s(100x100)"/>" border="0"/>
					</mm:relatednodes>

			                <%@include file="has_audio_video.jsp" %>
					</a>
					
					</td>
				</tr>
