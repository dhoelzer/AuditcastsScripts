global host_names_in_emails: string_set;
global possible_bad_addresses: addr_set;

event mime_entity_data(c: connection, length: count, data: string)
{
  for (a in find_all(data, /http:\/\/[^\/]+/))
  {
    add host_names_in_emails[split(a, /\//)[3]];
  }
}


event dns_A_reply(c:connection, msg:dns_msg, ans:dns_answer, a:addr)
{
  if(ans$query in host_names_in_emails)
  {
    add possible_bad_addresses[a];
  }
}

event http_request(c:connection, method:string, original_URI:string, unescaped_URI:string, version:string)
{
  if(c$id$resp_h in possible_bad_addresses)
  {
    print fmt(">> Web request to URL found in email!  Requested URL -> %s", original_URI);
  }
}
