function Generate-Garbage{
    $length = Get-Random -Minimum 25 -Maximum 100
    $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'.ToCharArray()
    $randomString = -join ($characters | Get-Random -Count $length )
    
    return $randomString
}

$text_one = "Nice job decoding the first part. Can you get all of the messages in here?"
$text_two = "Hey look at that! You got the second part, nice job. Is there another? This ain't the flag, but you must be close to finding it."
$text_flag = "FLAG{DO_YOU_EVEN_POWERSHELL_BRO?}"
$delimeter = "MfxPl"

$rand_string = Generate-Garbage

$encoded_one = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($text_one))
$encoded_two = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($text_two))
$encoded_random = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($rand_string))
$encoded_flag = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($text_flag))


$combinedblock_one = $encoded_one + $delimeter
$combinedblock_two = $encoded_two + $delimeter
$combined_garbage_one = $encoded_random + $delimeter
$combined_garbage_two = $delimeter + $encoded_random
$protected_flag_raw = $encoded_flag + $delimeter

$final_encoded_one = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($combinedblock_one))
$final_encoded_two = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($combinedblock_two))
$final_encoded_garbage_one = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($combined_garbage_one))
$final_encoded_garbage_two = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($combined_garbage_two))
$final_encoded_flag = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($protected_flag))

$final = $final_encoded_garbage_one + $final_encoded_garbage_one + $final_encoded_one + $final_encoded_garbage_two + $final_encoded_garbage_one +  $final_encoded_two + $final_encoded_garbage_one + $final_encoded_garbage_one + $final_encoded_garbage_two + $final_encoded_flag + $final_encoded_garbage_one + $final_encoded_garbage_two + $final_encoded_garbage_two
$final_encoded = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($final))
$final_encoded