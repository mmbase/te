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

