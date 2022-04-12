# Overridable
{
  'PMBE_TOKEN' => 'testing'
}.each do |k,v|
  Object.const_set(
    k,
    ENV[k] || v) 
end
