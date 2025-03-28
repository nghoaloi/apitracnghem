<?php

/**
 * @OA\Info(
 *     version="1.0.0",
 *     title="API Documentation",
 *     description="API documentation for your application",
 *     @OA\Contact(
 *         email="your-email@example.com"
 *     ),
 *     @OA\License(
 *         name="MIT",
 *         url="https://opensource.org/licenses/MIT"
 *     )
 * )
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Question;

/**
 * @OA\Schema(
 *     schema="Question",
 *     type="object",
 *     title="Question",
 *     description="Schema for a Question",
 *     @OA\Property(property="Id", type="integer", description="ID của câu hỏi"),
 *     @OA\Property(property="CategoryId", type="integer", description="ID danh mục"),
 *     @OA\Property(property="Content", type="string", description="Nội dung câu hỏi"),
 *     @OA\Property(property="AnswerA", type="string", description="Đáp án A"),
 *     @OA\Property(property="AnswerB", type="string", description="Đáp án B"),
 *     @OA\Property(property="AnswerC", type="string", description="Đáp án C"),
 *     @OA\Property(property="AnswerD", type="string", description="Đáp án D"),
 *     @OA\Property(property="AnswerCorrect", type="string", description="Đáp án đúng"),
 *     @OA\Property(property="CreatedAt", type="string", format="date-time", description="Thời gian tạo"),
 *     @OA\Property(property="CreatedBy", type="integer", description="Người tạo")
 * )
 */

class QuestionController extends Controller
{
    public function __construct()
    {
        // Remove or modify this line if it exists
        // $this->middleware('auth'); // This is unnecessary if middleware is applied in routes
    }

    public function index()
    {
        // Lấy tất cả câu hỏi từ bảng question
        $questions = Question::all();

        // Trả về dữ liệu dưới dạng JSON
        return response()->json($questions);
    }

    /**
     * @OA\Get(
     *     path="/api/questions/{id}",
     *     summary="Lấy câu hỏi theo ID",
     *     tags={"Questions"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID của câu hỏi",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Thành công",
     *         @OA\JsonContent(ref="#/components/schemas/Question")
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Không tìm thấy câu hỏi"
     *     )
     * )
     */
    public function getQuestionById($id)
    {
        \Log::info("Fetching question with ID: $id");
        $question = Question::find($id);

        if (!$question) {
            \Log::error("Question not found for ID: $id");
            return response()->json(['error' => 'Question not found'], 404);
        }

        \Log::info("Question found: " . json_encode($question));
        return response()->json($question);
    }

    public function store(Request $request)
    {
        // Validate dữ liệu đầu vào
        $validatedData = $request->validate([
            'CategoryId' => 'required|integer',
            'Content' => 'required|string',
            'AnswerA' => 'required|string',
            'AnswerB' => 'required|string',
            'AnswerC' => 'required|string',
            'AnswerD' => 'required|string',
            'AnswerCorrect' => 'required|string|max:1',
            'CreatedBy' => 'required|integer',
        ]);

        // Tạo câu hỏi mới
        $question = Question::create($validatedData);

        // Trả về câu hỏi vừa tạo
        return response()->json($question, 201);
    }
}
